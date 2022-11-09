
import 'dart:io';
import 'dart:isolate';
import 'dart:typed_data';

import 'package:io/io.dart';




class Helper {
  const Helper._();

/*
*
*  Init of YAML Files in Your Project
*
* */
  static Future<void> get initRequiredDependenciesToProject => _initRequiredDependencies();
  static _initRequiredDependencies() async {
    await _updateYAMLFilesToProject("pubspec.yaml");
    await _updateYAMLFilesToProject('package_rename_config.yaml');
    await _updateYAMLFilesToProject('flutter_native_splash.yaml',);
    await _updateYAMLFilesToProject('flutter_launcher_icons.yaml');
  }


/*
*
*  Create base project structure.
*
* */
  static Future<void> get baseProjectStructureInit => _createBaseProjectStructure();
  static  _createBaseProjectStructure() async {
    Uri? baseAppFolder = await Isolate.resolvePackageUri(Uri(scheme: 'package', path: 'base_application/app/'));
    String? baseAppPath = baseAppFolder?.path;
    if(baseAppPath == null) { return;}
    await copyPath(baseAppPath,'lib/');
  }


  static _updateYAMLFilesToProject(String fileName) async {
    Uri? fileUri = await Isolate.resolvePackageUri(Uri(scheme: 'package', path: 'base_application/yaml_file/$fileName'));
    Uint8List data = File(fileUri!.path).readAsBytesSync();
    File file = File(fileName);
    if(!file.existsSync()) {
      await file.create(recursive: true);
    }
    await file.writeAsBytes(data);
  }

}