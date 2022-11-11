import 'package:flutter_boilerplate_example/common/data/constants/storage_keys.dart';
import 'package:flutter_boilerplate_example/common/services/http/base_http.dart';
import 'package:flutter_boilerplate_example/common/services/navigation/navigation.dart';
import 'package:flutter_boilerplate_example/common/services/storage/storage.dart';
import 'package:flutter_boilerplate_example/common/utils/loaders.dart';

class AuthenticationController {
  //---> Singleton Creation
  static final AuthenticationController _ =
      AuthenticationController._internal();
  factory AuthenticationController() => _;
  AuthenticationController._internal();
  static const classTag = "AuthenticationController";

  void updateUserName(String? name) {
    AppStorage.updateValue(StorageKeys.userNameKey, name);
  }

  void onLoginPressed() {
    CustomLoaders.loaderDialog(show: true);
    Future.delayed(const Duration(seconds: 3), () {
      CustomLoaders.loaderDialog(show: false);

      ///NOTE:- Use unique token. Using user_name just for example!!
      BaseHttp.storeToken(AppStorage.getValue(StorageKeys.userNameKey));
    });
  }

  void onLogout() async {
    ///Note:- Don't forget to clear the stack when changing Authentication Status!!
    navigationService.clearStack();
    await AppStorage.clearStorage();
    await BaseHttp.clearCacheStorage();
  }
}
