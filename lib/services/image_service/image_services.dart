import 'dart:io';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:path_provider/path_provider.dart';

class ImageServices {

  static final ImageServices _service = ImageServices._internal();
  factory ImageServices() => _service;
  ImageServices._internal();




  Future<String> getCompressedImageFilePath(String filePath) async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;
    File newFile = File(filePath);
    final result = await FlutterImageCompress.compressAndGetFile(
      newFile.absolute.path,
      "$appDocPath/sap_${DateTime.now().millisecondsSinceEpoch}.${filePath.split(".").last}",
      quality: 100,
      minWidth: 480,
      minHeight: 480,
      rotate: 0,
    );
    return result!.path;
  }
  


}