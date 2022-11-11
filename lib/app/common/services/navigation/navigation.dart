import 'package:flutter/material.dart';
import '../log/log.dart';

///Instance of [NavigationService].
///
///Use is [navigationService] instance to access [context] and many navigation services anywhere in the application.
final NavigationService navigationService = NavigationService.get();

/// Navigation Service File which contains many functionalities of navigation throughout the application.
///
/// As it is a Singleton Class always use [navigationService] instance.
class NavigationService {
  final GlobalKey<NavigatorState> _navigationKey = GlobalKey<NavigatorState>();
  NavigationService._();
  static NavigationService? _instance;
  static NavigationService get() => _instance ?? NavigationService._();
  GlobalKey<NavigatorState> get navigationKey => _navigationKey;

  BuildContext get context => navigationKey.currentState!.context;

  /// Use this function to navigate to anther named Page.
  to({required String name}) {
    if (_navigationKey.currentState != null) {
      Navigator.pushNamed(_navigationKey.currentState!.context, name);
    } else {
      kLog("No Navigation State found!", logStatus: LogStatus.ERROR);
    }
  }

  /// Use this function to navigate back.
  back() {
    if (_navigationKey.currentState != null) {
      Navigator.pop(_navigationKey.currentState!.context);
    } else {
      kLog("No Navigation State found!", logStatus: LogStatus.ERROR);
    }
  }

  /// Use this function to navigate back to HomePage of the application.
  clearStack() {
    if (_navigationKey.currentState != null) {
      Navigator.popUntil(
          _navigationKey.currentState!.context, (route) => route.isFirst);
    } else {
      kLog("No Navigation State found!", logStatus: LogStatus.ERROR);
    }
  }

  /// Use this function to replace a page from one page using named routes.
  replace({required String name}) {
    if (_navigationKey.currentState != null) {
      Navigator.pushReplacementNamed(
          _navigationKey.currentState!.context, name);
    } else {
      kLog("No Navigation State found!", logStatus: LogStatus.ERROR);
    }
  }
}
