import 'package:flutter/material.dart';
import 'common/utils/initializer.dart';
import 'modules/initial/pages/initial_material_app.dart';


void main() {
 ///NOTE:- All initializer things for different projects must be added in [Initializer] class's init method.
 Initializer.init(() {
  runApp(const InitMaterialApp());
 });
}

