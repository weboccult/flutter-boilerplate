# Flutter Boilerplate

[![pub package](https://img.shields.io/pub/v/flutter_boilerplate.svg)](https://pub.dev/packages/flutter_boilerplate)

Flutter boilerplate to kick start your application development process.    


## Installation

 -  add the following in your `pubspec.yaml`:
```yaml
dependencies:
  flutter_boilerplate: ^0.0.1
```


## Init Base Project:

This command will add the basic project structure for your flutter application.
-  COMMAND: 
```
flutter pub run flutter_boilerplate:init
```

**Note:** Run above command only for new projects. It will replace the `lib folder` & replace `pubspec.yaml` files of your project.
Don't forget to `setup icons`, `splash screens` and `package name` after initialization of base project. (Steps are written in respective YAML files).
All required YAML files will be imported to your project directly after running the `init` command!

### Included Modules/Packages/Plugins:
| Module name          | argument             | package version | latest version |
|----------------------|----------------------|-----------------|----------------|
| Responsive Framework | responsive_framework | ^0.2.0| [![pub package](https://img.shields.io/pub/v/responsive_framework.svg)](https://pub.dev/packages/responsive_framework) |
| Dio | dio | ^4.0.6 | [![pub package](https://img.shields.io/pub/v/dio.svg)](https://pub.dev/packages/dio) |
| Get Storage | get_storage | ^2.0.3 | [![pub package](https://img.shields.io/pub/v/get_storage.svg)](https://pub.dev/packages/get_storage) |
| Path Provider | path_provider | ^2.0.11 | [![pub package](https://img.shields.io/pub/v/speech_to_text.svg)](https://pub.dev/packages/path_provider) |


## How to import optional modules:
-  COMMAND: 
```
flutter pub run flutter_boilerplate:add <arguments>
```
**Note:** You have to manually import & do native configurations for respective packages. Below Service modules will be added to your project at `PATH:- lib/common/services/<argument>`


## Optional Modules

| Module name          | argument             | package version | latest version |
|----------------------|----------------------|-----------------|----------------|
| Audio Player | audio_player | ^3.0.5 | [![pub package](https://img.shields.io/pub/v/assets_audio_player.svg)](https://pub.dev/packages/assets_audio_player) |
| Apple Sign-in | apple_authentication | ^4.2.0 | [![pub package](https://img.shields.io/pub/v/sign_in_with_apple.svg)](https://pub.dev/packages/sign_in_with_apple) |
| Google Sign-in | google_authentication | ^5.4.2 | [![pub package](https://img.shields.io/pub/v/google_sign_in.svg)](https://pub.dev/packages/google_sign_in) |
| Speech to Text | speech_to_text | ^6.1.0 | [![pub package](https://img.shields.io/pub/v/speech_to_text.svg)](https://pub.dev/packages/speech_to_text) |
| Text to Speech | text_to_speech | ^3.5.3 | [![pub package](https://img.shields.io/pub/v/text_to_speech.svg)](https://pub.dev/packages/text_to_speech) |
| Image Compress* | image_service | ^6.1.0 | [![pub package](https://img.shields.io/pub/v/flutter_image_compress.svg)](https://pub.dev/packages/flutter_image_compress) |

=> _more modules will be included in future!!_

