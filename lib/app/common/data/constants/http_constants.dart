
import 'package:base_application/app/common/env/environment.dart';
import 'package:base_application/app/common/env/types/staging.env.dart';

class HttpConstants {
  //---> Singleton Creation
  static final HttpConstants _ = HttpConstants._internal();
  factory HttpConstants() => _;
  HttpConstants._internal();


  static const appName = '';

  ///--> Change ENV Here!
  static Environment env = Staging();




}