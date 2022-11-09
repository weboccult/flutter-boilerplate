import 'package:flutter/material.dart';

import '../../modules/initial/pages/initial_page.dart';




abstract class Routes {
  ///--> define your routes here!
  static const INITIAL = '/initial';

}

abstract class RouteServices {
  const RouteServices._();

  ///STARTING ROUTE OF APPLICATION
  static const STARTING_POINT = Routes.INITIAL;

  ///--> Add your application routes here!
  static Map<String, Widget Function(BuildContext context)> routes = {
    Routes.INITIAL: (context) => const InitialPage(),
  };


  /// TODO: add routing animation here!!
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
