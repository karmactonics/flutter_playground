import 'package:flutter/material.dart';
import 'package:playground/image_picker_view.dart';
import 'package:playground/my_text_form.dart';
import 'package:playground/hero_view.dart';
import 'package:playground/tutorial.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Playground',
      theme: new ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'Hiragino Kaku Gothic ProN',
      ),
      home: MainView(),
    );
  }
}

class MainView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MainViewState();
  }
}

class MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('メニュー')),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('画像選択テスト'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ImagePickerView();
              }));
            },
          ),
          Divider(),
          ListTile(
            title: Text('テキスト入力'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return MyTextFormView();
              }));
            },
          ),
          Divider(),
          ListTile(
              title: Text('Heroアニメーション'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return HeroView();
                }));
              }),
          Divider(),
          ListTile(            
              title: Text('チュートリアル風画面'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Tutorial();
                }));
              }),

        ],
      ),
    );
  }
}
