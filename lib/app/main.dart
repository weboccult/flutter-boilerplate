import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app/common/data/constants/constants.dart';
import 'package:flutter_boilerplate/app/common/routes/route_service.dart';
import 'package:flutter_boilerplate/app/modules/initial/pages/initial_page.dart';
import 'common/utils/initializer.dart';
import 'modules/initial/pages/initial_material_app.dart';

///Goto [InitialPage] to setup starting pages of your applications.
///
/// Goto [InitMaterialApp] to setup Material App of your application.
///
///Goto [RouteServices] to setup routes of your application.
///
///Goto [Constants] to specify [ENV] & [Constants.appName].
///
///Setup your
///
///[pubspec.yaml],
///
///[flutter_launcher_icons.yaml],
///
///[flutter_native_splash.yaml],
///
///[package_rename_config.yaml]
///
/// files after running init command of flutter_boilerplate.
///
void main() {
  ///NOTE:- All initializer things for different projects must be added in [Initializer] class's init method.
  Initializer.init(() {
    runApp(const InitMaterialApp());
  });
}
