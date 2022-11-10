
import '../../env/environment.dart';
import '../../env/types/staging.env.dart';

class StorageKeys {
  //---> Singleton Creation
  static final StorageKeys _ = StorageKeys._internal();
  factory StorageKeys() => _;
  StorageKeys._internal();

  static const userNameKey = 'user_name';

  static const randomStringKey = 'random_string';

  static const randomIDKey = 'random_id';



}