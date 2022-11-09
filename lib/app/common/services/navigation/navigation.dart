import 'package:flutter/material.dart';
import '../log/log.dart';


final NavigationService navigationService = NavigationService.get();

class NavigationService {
  final GlobalKey<NavigatorState> _navigationKey = GlobalKey<NavigatorState>();
  NavigationService._();
  static NavigationService? _instance;
  static NavigationService get() =>  _instance ?? NavigationService._();
  GlobalKey<NavigatorState> get navigationKey => _navigationKey;


  BuildContext get context =>  navigationKey.currentState!.context;

  to({required String name}) {
    if(_navigationKey.currentState != null) {
      Navigator.pushNamed(_navigationKey.currentState!.context,name);
    } else{
      kLog("No Navigation State found!",logStatus: LogStatus.ERROR);
    }
  }

  back() {
    if(_navigationKey.currentState != null) {
      Navigator.pop(_navigationKey.currentState!.context);
    } else{
      kLog("No Navigation State found!",logStatus: LogStatus.ERROR);
    }
  }


  clearStack() {
    if(_navigationKey.currentState != null) {
      Navigator.popUntil(_navigationKey.currentState!.context, (route) => route.isFirst);
    } else{
      kLog("No Navigation State found!",logStatus: LogStatus.ERROR);
    }
  }

  replace({required String name}) {
    if(_navigationKey.currentState != null) {
      Navigator.pushReplacementNamed(_navigationKey.currentState!.context,name);
    } else{
      kLog("No Navigation State found!",logStatus: LogStatus.ERROR);
    }
  }


}
