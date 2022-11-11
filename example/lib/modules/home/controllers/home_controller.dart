import 'package:flutter_boilerplate_example/common/data/constants/storage_keys.dart';
import 'package:flutter_boilerplate_example/common/routes/route_service.dart';
import 'package:flutter_boilerplate_example/common/services/navigation/navigation.dart';
import 'package:flutter_boilerplate_example/common/services/storage/storage.dart';
import 'package:flutter_boilerplate_example/modules/home/modals/users_modal.dart';

import '../../../common/data/constants/api_strings.dart';
import '../../../common/services/http/base_http.dart';
import '../../../services/api_services.dart';

class HomeController {
  //---> Singleton Creation
  static final HomeController _ = HomeController._internal();
  factory HomeController() => _;
  HomeController._internal();
  static const classTag = "HomeController";

  getUserName() {
    return AppStorage.getValue(StorageKeys.userNameKey);
  }

  Future getUsers() {
    return baseHttp.get(
        endPointURL: ApiStrings.usersAPIString, addToCache: true);
  }

  Future getRandomPOSTS(int randomID) {
    return baseHttp.get(
        endPointURL: '${ApiStrings.postsAPIString}/$randomID',
        addToCache: true);
  }

  goToHTTPWidgetExamplePage() {
    navigationService.to(name: Routes.HTTP_WIDGET_EXAMPLE_PAGE);
  }

  goToStorageListenerExampleWidget() {
    navigationService.to(name: Routes.STORAGE_LISTENER_EXAMPLE_PAGE);
  }

  goToCombinedHttpAndStorageListenerWidget() {
    navigationService.to(
        name: Routes
            .COMBINED_HTTP_WIDGET_AND_STORAGE_LISTENR_WIDGET_EXAMPLE_PAGE);
  }
}
