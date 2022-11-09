
import 'package:base_application/app/common/env/environment.dart';
import 'package:base_application/app/common/env/types/staging.env.dart';

class Constants {
  //---> Singleton Creation
  static final Constants _ = Constants._internal();
  factory Constants() => _;
  Constants._internal();


  static const appName = '';

  ///--> Change ENV Here!
  static Environment env = Staging();




}