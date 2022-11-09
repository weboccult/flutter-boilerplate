
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
    return "100";
  }


  @override
  String appVersion() {
    return "2.2.60";
  }

  @override
  int isBeta() {
    return 0;
  }
}
