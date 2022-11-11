import '../environment.dart';

class Production extends Environment {
  @override
  String apiUrl() {
    return "";
  }

  @override
  String socketUrl() {
    return "";
  }

  @override
  String buildNumber() {
    return "1";
  }

  @override
  String appVersion() {
    return "1.0.0";
  }

  @override
  int isBeta() {
    return 0;
  }
}
