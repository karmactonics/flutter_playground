import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:playground/controller/file_controller.dart';

class ImagePickerView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ImagePickerViewState();
  }
}

class ImagePickerViewState extends State<ImagePickerView> {
  File imageFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('ImagePicker'),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: Container(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              (imageFile == null)
                  ? Icon(Icons.no_sim)
                  : Image.memory(
                      imageFile.readAsBytesSync(),
                      height: 100.0,
                      width: 100.0,
                    ),
              Container(
                  padding: EdgeInsets.all(10.0),
                  child: RaisedButton(
                    child: Text('カメラで撮影'),
                    onPressed: () {
                      _getAndSaveImageFromDevice(ImageSource.camera);
                    },
                  )),
              Container(
                  padding: EdgeInsets.all(10.0),
                  child: RaisedButton(
                    child: Text('ライブラリから選択'),
                    onPressed: () {
                      _getAndSaveImageFromDevice(ImageSource.gallery);
                    },
                  )),
            ],
          ),
        ));
  }

// カメラまたはライブラリから画像を取得
// void _getImageFromDevice(ImageSource source) async { //メソッド名変更
  void _getAndSaveImageFromDevice(ImageSource source) async {
    // 撮影/選択したFileが返ってくる
    var imageFile = await ImagePicker.pickImage(source: source);
    // 撮影せずに閉じた場合はnullになる
    if (imageFile == null) {
      return;
    }

    var savedFile = await FileController.saveLocalImage(imageFile); //追加

    setState(() {
      // this.imageFile = imageFile;
      this.imageFile = savedFile; //変更
    });
  }
}
