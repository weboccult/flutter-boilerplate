import 'package:base_application/app/common/env/environment.dart';
import 'package:base_application/app/common/env/types/staging.env.dart';

class StorageConstants {
  //---> Singleton Creation
  static final StorageConstants _ = StorageConstants._internal();
  factory StorageConstants() => _;
  StorageConstants._internal();


  static const appName = '';

  ///--> TODO Change ENV Here!
  static Environment env = Staging();




}