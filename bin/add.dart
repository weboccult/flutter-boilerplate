




import 'dart:isolate';
import 'package:io/io.dart';

void main(List<String> args) async {
  await _addAServiceModuleToApp(args);
}



_addAServiceModuleToApp(List<String> args) async  {
  try {
    for (var arg in args) {
      String outPutPath = 'lib/common/services/$arg/';
      Uri? packageURI = await Isolate.resolvePackageUri(Uri(scheme: 'package',   path: 'base_application/services/$arg/'));
      String? inputFilePath = packageURI?.path;
      if(inputFilePath == null) { return;}
      await copyPath(inputFilePath,outPutPath);
    }
    print("packages added!");
  } catch(e) {
    print("error $e");
  }

}