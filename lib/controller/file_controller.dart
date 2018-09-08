import 'dart:async';
import 'dart:io'; // 追加
import 'package:path_provider/path_provider.dart';

class FileController {
  // ドキュメントのパスを取得
  static Future<String> get localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  // 画像をドキュメントへ保存する。
  // 引数にはカメラ撮影時にreturnされるFileオブジェクトを持たせる。
  static Future<File> saveLocalImage(File image) async {
    final path = await localPath;
    final imagePath = '$path/image.png';
    File imageFile = File(imagePath);
    // カメラで撮影した画像は撮影時用の一時的フォルダパスに保存されるため、
    // その画像をドキュメントへ保存し直す。
    var savedFile = await imageFile.writeAsBytes(await image.readAsBytes());
    // もしくは
    // var savedFile = await image.copy(imagePath);
    // でもOK

    return savedFile;
  }

  // ドキュメントの画像を取得する。
  static Future<File> loadLocalImage() async {
    final path = await localPath;
    final imagePath = '$path/image.png';
    return File(imagePath);
  }
}
