import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_example/modules/home/modules/combined_example/combined_example.dart';
import 'package:flutter_boilerplate_example/modules/home/modules/http_widget_example/http_widget_example.dart';

import '../../modules/home/modules/storage_listener_widget_example/storage_listener_widget_example.dart';
import '../../modules/initial/pages/initial_page.dart';




abstract class Routes {
  ///--> define your routes here!
  static const INITIAL = '/initial';
  static const HTTP_WIDGET_EXAMPLE_PAGE = '/http_widget_example_page';
  static const STORAGE_LISTENER_EXAMPLE_PAGE = '/storage_listener_example_page';
  static const COMBINED_HTTP_WIDGET_AND_STORAGE_LISTENR_WIDGET_EXAMPLE_PAGE = '/combined_storage_listener_and_http_widget_example_page';

}

abstract class RouteServices {
  const RouteServices._();

  ///STARTING ROUTE OF APPLICATION
  static const STARTING_POINT = Routes.INITIAL;

  ///--> Add your application routes here!
  static Map<String, Widget Function(BuildContext context)> routes = {
    Routes.INITIAL: (context) => const InitialPage(),
    Routes.HTTP_WIDGET_EXAMPLE_PAGE: (context) => const HttpWidgetExample(),
    Routes.STORAGE_LISTENER_EXAMPLE_PAGE: (context) => const StorageListenerWidgetExample(),
    Routes.COMBINED_HTTP_WIDGET_AND_STORAGE_LISTENR_WIDGET_EXAMPLE_PAGE: (context) => const CombinedHttpAndStorageListenerExample(),
  };


  /// add routing animation here!!
  static PageRoute onGenerateRoute(settings, context) {
    /// Custom Route Animations for Custom Pages
    // if (settings.name == "/someRoute") {
    //   return PageRouteBuilder(
    //       settings: settings, // Pass this to make popUntil(), pushNamedAndRemoveUntil(), works
    //       pageBuilder: (_, __, ___) => Routes.routes[settings.name]!(context),
    //       transitionsBuilder: (_, a, __, c) => FadeTransition(opacity: a, child: c));
    // }
    return MaterialPageRoute(builder: (_) => RouteServices.routes[settings.name]!(context));
  }
}
