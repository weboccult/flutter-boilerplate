import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

import '../../app/common/services/log/log.dart';




class SSTService {
  //---> Singleton Creation
  static final SSTService _service = SSTService._internal();
  factory SSTService() => _service;
  SSTService._internal();

  final SpeechToText _speechToText = SpeechToText();

  /// This has to happen only once per app
Future initSpeechToText() async {
    await _speechToText.initialize();
    kLog("SST Initialized!");
  }

  /// Each time to start a speech recognition session
  void startListening({required void Function(SpeechRecognitionResult?) speechListenFunction}) async {
    kLog("Listening...!!!");
    await _speechToText.listen(
        pauseFor: const Duration(seconds: 5),
        onResult: speechListenFunction);
  }

  /// Manually stop the active speech recognition session
  /// Note that there are also timeouts that each platform enforces
  /// and the SpeechToText plugin supports setting timeouts on the
  /// listen method.
  void stopListening() async {
    kLog("STOP Listening...!!!");
    await _speechToText.stop();
  }



}
