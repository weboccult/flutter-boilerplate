import '../../env/environment.dart';
import '../../env/types/staging.env.dart';

class Constants {
  //---> Singleton Creation
  static final Constants _ = Constants._internal();
  factory Constants() => _;
  Constants._internal();

  static const appName = 'Example BoilerPlate Application';

  ///--> Change ENV Here!
  static Environment env = Staging();
}
