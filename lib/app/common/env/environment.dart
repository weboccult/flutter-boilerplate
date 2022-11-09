/// Create an ENV type here!!
enum ENV { staging, production }

/// Define new Parameter Functions here for different ENVs
abstract class Environment {
  String apiUrl();
  String socketUrl();
  String buildNumber();
  String appVersion();
  int isBeta();
}
