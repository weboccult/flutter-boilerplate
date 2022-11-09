import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';
import '../../../common/data/constants/constants.dart';
import '../../../common/routes/route_service.dart';
import '../../../common/services/navigation/navigation.dart';



class InitMaterialApp extends StatelessWidget {
  const InitMaterialApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: Constants.appName,
      debugShowCheckedModeBanner: false,
      //TODO: use onGenerateRoute for Custom Routing/Navigation Animations
      // onGenerateRoute: (settings) => Routes.onGenerateRoute(settings,context),
      initialRoute: RouteServices.STARTING_POINT,
      routes: RouteServices.routes,
      navigatorKey: navigationService.navigationKey,
      builder: (context, widget) => ResponsiveWrapper.builder(
        ClampingScrollWrapper.builder(context, widget!),
        mediaQueryData: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        defaultScale: true,
        breakpoints: [
          const ResponsiveBreakpoint.resize(450, name: MOBILE),
          const ResponsiveBreakpoint.autoScale(800, name: TABLET),
          const ResponsiveBreakpoint.autoScale(1000, name: TABLET),
          const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
          const ResponsiveBreakpoint.autoScale(2460, name: "4K"),
        ],
      ),
    );
  }
}