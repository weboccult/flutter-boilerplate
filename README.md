# Flutter Boilerplate

[![pub package](https://img.shields.io/pub/v/flutter_boilerplate.svg)](https://pub.dev/packages/flutter_boilerplate)

Flutter boilerplate to kick start your application development process. This Package includes ready use Project Structure, Basic Service Files and Ready to use Widgets.
All the Basic Project Files are directly included in your `lib` folder, hence you can customized every service/widget files according to your own use case.


|             | Android | iOS    |
|-------------|---------|--------|
| **Support** | SDK 21+ | iOS 9+ |


## Installation

 - add the following in your `pubspec.yaml`:

```yaml
dependencies:
  flutter_boilerplate: ^0.0.5
```


## Init Base Project:

This command will add the basic project structure for your flutter application.

- COMMAND: 

```
flutter pub run flutter_boilerplate:init
```

**Note:** Run above command only for new projects. It will replace the `lib folder` & replace `pubspec.yaml` files of your project.
Don't forget to `setup icons`, `splash screens` and `package name` after initialization of base project. (Steps are written in respective YAML files).
All required YAML files will be imported to your project directly after running the `init` command!

### Included Modules/Packages/Plugins:

| Module name            | package version      | latest version                                                                                                         |
|------------------------|----------------------|------------------------------------------------------------------------------------------------------------------------|
| Responsive Framework   | 0.2.0                | [![pub package](https://img.shields.io/pub/v/responsive_framework.svg)](https://pub.dev/packages/responsive_framework) |
| Dio                    | 4.0.6                | [![pub package](https://img.shields.io/pub/v/dio.svg)](https://pub.dev/packages/dio)                                   |
| Get Storage            | 2.0.3                | [![pub package](https://img.shields.io/pub/v/get_storage.svg)](https://pub.dev/packages/get_storage)                   |
| Path Provider          | 2.0.11               | [![pub package](https://img.shields.io/pub/v/speech_to_text.svg)](https://pub.dev/packages/path_provider)              |


## Ready to use Service Widgets:

Following widgets are directly imported to your project structure after running `init` command.

### HttpWidget:-

``` dart
HttpWidget(
      key: const ValueKey(ApiStrings.usersAPIString),
      errorWidget: CustomLoaders.circularLoader(),
      loader:  CustomLoaders.circularLoader(),
      api: hC.getUsers(),
      useCache: true,
      apiURL: ApiStrings.usersAPIString,
      builder: (data) {
        List<UserDTO> users = (data as List).map((e) => UserDTO.fromJson(e)).toList();
        return ListView.builder(
          itemCount: users.length,
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          itemBuilder: (context, index) {
            return ListTile(
              leading: Text('${users[index].id}'),
              title: Text('${users[index].name}'),
              subtitle: Text('${users[index].email}'),
            );
          },
        );
      },
    )
```

See the `example` app for more proper use case.

### StorageListenerWidget:-

``` dart
  StorageListenerWidget(
                storage: AppStorage.storage,
                listenKey: StorageKeys.randomStringKey,
                builder: (value) {
                  return Text('RANDOM STRING :-  $value');
                },
              ),
```

See the `example` app for more proper use case.

## Ready to use Service Files:

Following service files are directly imported to your project structure after running `init` command.

### BaseHttp:

Ready to use `baseHttp` instance and many functions such as :-

- storeToken
- getToken
- checkAuthStatus
- storeAuthData
- getAuthData
- storeDefaultHeaders
- getDefaultHeaders
- getStream
- get
- post

### BaseInterceptor:

`BaseInterceptor` used by default with `baseHttp` instance. It's methods/functions are listed below:-

- getHeaders
- onError
- onRequest
- onResponse

### Log:

`kLog` can be used for logging in applications. It give direct access to filter-out logs, write logs in files(in development), assign `tags` and `types` to logs and many more.

```dart
 logsExample() {
  kLog("on info",logStatus: LogStatus.INFO,tag: 'log_example');
  kLog("on error",logStatus: LogStatus.ERROR,tag: 'log_example');
  kLog("on warning",logStatus: LogStatus.WARNING,tag: 'log_example');
}
```

### Storage:

`GetStorage` is used in this `StorageService`. Ready to use `Storage` instance and `CRUD` functions/methods are available.

- saveValue
- updateValue
- updateNewValue
- getValue
- hasData
- removeValue
- clearStorage

### Navigation:

Ready to use `navigationService` instance which has many navigation methods/functionalities ready to use such as :-

- context
- to
- back
- replace
- clearStack

### Utils:

Ready to utils files as listed below.

- extensions.dart
    - String extensions such as :- `imagePathToBase64String`, `toColor`, `toCapitalized`
  
- initializer.dart
    - by default used to initialize the application.
  
- lifecycle_handler.dart
    - default global level lifecycle handler.
  
- loaders.dart
    - CustomLoaders which can be used such as :- `circularLoader`,`loaderDialog`,`imageLoadingBuilder`,`isLoading`,`setLoading`
  
- utils.dart
    - Ready to use basic utilities such as :- `getFileSize`,`getRandomString` and many more.
  
- validators.dart
    - Ready to use `Validators` such as :- `validateEmpty`, `validateEmail`, `validateOTPCode` and many more which can be directly used with Input Field Validators.
  

## Ready to use Constant Files:

Following constant files are directly imported to your project structure after running `init` command.

### Assets

```dart
///add all your application static assets here!!
abstract class Assets {
//eg:
//static const exampleAsset = 'assets/images/example_assets.svg';

}
```

### ApiStrings

```dart
/// declare all your api constant end-points or strings here!!
abstract class ApiStrings {

//eg:
//static const loginAPIString = 'example/login';


}
```

### Constants

```dart
/// declare your env to use all the basic constants of your application in this file!!
abstract class Constants {

  /// enter your application name here!!
  static const appName = '';

  /// change ENV Here!
  static Environment env = Staging();

}
```

### StorageKeys

```dart
/// use this class to store all your storage keys. It's a good practice to keep all your storage keys at one place.
abstract class StorageKeys {

//eg:
//static const userNameKey = 'user_name';


}
```

### Strings

```dart
/// add all your common application strings here!
abstract class Strings {


  static const String appName = Constants.appName;

  ///--> Authentication Module
  static const welcomeBack = 'Welcome Back!';
  static const getStarted = 'Get Started';
  static const loginToContinue = 'Login to continue';
  static const createAnAccount = 'Create an account';
  ///--> input field validations
  static const String cantBeEmpty = "can't be empty.";
  static const String fieldCantBeEmpty = 'Field $cantBeEmpty';
  static const String enterValid = 'Please enter a valid';
  static const otpValidation = 'Invalid OTP';
  ///---> name <----
  static const fullName = 'Full Name';
  static const  enterYourFullName = 'Enter your full name';
  ///--> email <--
  static const emailAddress = 'Email Address';
  static const enterYourEmailAddress = 'Enter your email address';
  static const String emailCantBeEmpty = 'Email $cantBeEmpty';
  static const String enterValidEmail = '$enterValid email.';
  ///--> password <---
  static const String password = 'Password';
  static const enterYourPassword  = 'Enter your password';
  static const forgotPassword = 'Forgot Password';
  static const forgotPasswordDescription = "Enter your registered email id below to receive the password reset instructions & check your email";
  static const String confirmPassword = 'Confirm $password';
  static const String enterPassword = 'Enter $password';
  static const String passwordCantBeEmpty = '$password $cantBeEmpty';
  static const String passwordValidation = '$password must be at least 6 characters long.';
  static const confirmPasswordValidation = '$password and Confirm password should be same.';
  static const newPassword = "New Password";
  static const createNewPassword = "Now you can create a new password";
  static const reEnterYourPassword = "Re-enter your new password";
  ///--> mobile number <--
  static const mobileNumber = 'Mobile Number';
  static const String emailOrMobile = '$emailAddress or $mobileNumber';
  static const String numberCantBeEmpty = '$emailOrMobile $cantBeEmpty';
  static const String enterValidNumber = '$enterValid $mobileNumber.';
  ///--> Code <---
  static const String sendCode = "Send Code";
  static const String enterVerificationCode = "Enter Verification Code";
  static const verificationCodeSendToEmail = "We have sent you a code to verify your email address";
  static const resendOTP = 'Resend OTP';
  static const verify = 'Verify';
  ///--> log-in / sign-up  <---
  static const logIn  = 'Log in';
  static const signUp = 'Sign up';
  static const alreadyHaveAnAccount = "Do you already have an account? ";
  static const notHaveAnAccount = "Don't have an account? ";
  static const orContinueWith = 'or continue with';
  static const or = 'or';
  static const google = 'Google';
  static const apple = 'Apple';
  static const signInWithGoogle = 'Sign in with Google';
  static const signInWithApple = 'Sign in with Apple';



  ///--> Internet Error Strings <---
  static const unknownError = 'Unknown error! Please try again after some time.';
  static const connectionTimeout = 'Connection timeout. Please try again after some time.';
  static const noConnection = 'No connection. Please turn on your internet!';
  static const unauthorized = 'Unauthorized. Please login again!';


  /// --> Global Strings <---
  static const String ok = 'Ok';
  static const String error = 'Error';
  static const String noInternet = 'No internet. Please try again later.';
  static const String logOut = 'Log out';
  static const String retry = 'Retry';
  static const String confirm = 'Confirm';
  static const String somethingWentWrong = 'Something went wrong.';
  static const String home = 'Home';

  static const gallery = 'Gallery';
  static const camera = 'Camera';
  static const mobile = 'Mobile';
  static const from = 'From';
  static const toCap = 'To';
  static const success = 'Success';
  static const checkboxValidation = 'Dummy Checkbox Validation Message';
}
```

### Theme

```dart
/// add your application theme here!
abstract class Theme {
  
}
```

## Ready to use Environment Files:

### ENV:

```dart
enum ENV { staging, production }
/// Define new Parameter Functions here for different ENVs
abstract class Environment {
  String apiUrl();
  String socketUrl();
  String buildNumber();
  String appVersion();
  int isBeta();
}
```

### TYPES:

Different types of ENV can be specified. Below is an example how.

```dart
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
```

## Ready to use Routes Service File:

```dart
/// define all of your application routes here!!
abstract class Routes {
  ///--> define your routes here!
  static const INITIAL = '/initial';
}

/// define all of your route services here!!
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
```

## How to import optional modules:

- COMMAND: 

```
flutter pub run flutter_boilerplate:add <arguments>
```

**Note:** You have to manually import & do native configurations for respective packages. Below Service modules will be added to your project at `PATH:- lib/common/services/<argument>`


## Optional Modules

| Module name     | argument              | package version | latest version                                                                                                             |
|-----------------|-----------------------|-----------------|----------------------------------------------------------------------------------------------------------------------------|
| Audio Player    | audio_player          | 3.0.5           | [![pub package](https://img.shields.io/pub/v/assets_audio_player.svg)](https://pub.dev/packages/assets_audio_player)       |
| Apple Sign-in   | apple_authentication  | 4.2.0           | [![pub package](https://img.shields.io/pub/v/sign_in_with_apple.svg)](https://pub.dev/packages/sign_in_with_apple)         |
| Google Sign-in  | google_authentication | 5.4.2           | [![pub package](https://img.shields.io/pub/v/google_sign_in.svg)](https://pub.dev/packages/google_sign_in)                 |
| Speech to Text  | speech_to_text        | 6.1.0           | [![pub package](https://img.shields.io/pub/v/speech_to_text.svg)](https://pub.dev/packages/speech_to_text)                 |
| Text to Speech  | text_to_speech        | 3.5.3           | [![pub package](https://img.shields.io/pub/v/text_to_speech.svg)](https://pub.dev/packages/text_to_speech)                 |
| Image Compress* | image_service         | 6.1.0           | [![pub package](https://img.shields.io/pub/v/flutter_image_compress.svg)](https://pub.dev/packages/flutter_image_compress) |

### Project Structure:

```text
|-- lib
|   |-- common
|   |   |-- data
|   |   |   |-- assets
|   |   |   |   '-- assets.dart
|   |   |   |-- constants
|   |   |   |   |-- api_strings.dart
|   |   |   |   |-- constants.dart
|   |   |   |   '-- storage_keys.dart
|   |   |   |-- strings
|   |   |   |   '-- strings.dart
|   |   |   '-- theme
|   |   |       '-- theme.dart
|   |   |-- env
|   |   |   |-- environment.dart
|   |   |   '-- types
|   |   |       |-- production.env.dart
|   |   |       '-- staging.env.dart
|   |   |-- routes
|   |   |   '-- route_service.dart
|   |   |-- services
|   |   |   |-- http
|   |   |   |   |-- base_http.dart
|   |   |   |   '-- base_interceptor.dart
|   |   |   |-- log
|   |   |   |   '-- log.dart
|   |   |   |-- navigation
|   |   |   |   '-- navigation.dart
|   |   |   '-- storage
|   |   |       '-- storage.dart
|   |   |-- utils
|   |   |   |-- extensions.dart
|   |   |   |-- initializer.dart
|   |   |   |-- lifecycle_handler.dart
|   |   |   |-- loaders.dart
|   |   |   |-- snackbars.dart
|   |   |   |-- utils.dart
|   |   |   '-- validators.dart
|   |   '-- widgets
|   |       |-- compute
|   |       |   |-- compute_list_widget.dart
|   |       |   '-- compute_widget.dart
|   |       |-- http
|   |       |   '-- http_widget.dart
|   |       |-- image
|   |       |   '-- image_widget.dart
|   |       '-- listener
|   |           '-- storage_listener_widget.dart
|   |-- main.dart
|   '-- modules
|       '-- initial
|           '-- pages
|               |-- initial_material_app.dart
|               '-- initial_page.dart
```

=> _more modules will be included in future!!_

