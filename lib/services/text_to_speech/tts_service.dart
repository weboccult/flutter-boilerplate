
import 'dart:io';
import 'package:flutter_tts/flutter_tts.dart';


enum SpeakingStatus {SPEAKING,STOPPED}
class TTSService {
  //---> Singleton Creation
  static final TTSService _service = TTSService._internal();
  factory TTSService() => _service;
  TTSService._internal();

  final FlutterTts _tts = FlutterTts();
 static bool appInBackground = false;


  initialize() async {
    await _tts.setIosAudioCategory(IosTextToSpeechAudioCategory.playback, [
      IosTextToSpeechAudioCategoryOptions.defaultToSpeaker
    ]);
    // kLog("Voices are -> ${jsonEncode(await _tts.getVoices)}");
    if(Platform.isIOS) {
      var voice =
      // {"name":"Lekha","locale":"hi-IN"};
      // {"name":"Martha","locale":"en-GB"};
      // {"name":"Mónica","locale":"es-ES"};
      {"name":"Alex","locale":"en-US"};
      // {"name":"Catherine","locale":"en-AU"};
      // {"name":"Samantha","locale":"en-US"};
      // {"name":"Arthur","locale":"en-GB"};
          // {"name":"Alice","locale":"it-IT"};
      // {"name":"Ellen","locale":"nl-BE"};
      // _tts.setSpeechRate(0.5);
      // _tts.
      _tts.setVoice(voice);
    }
  }

  Future speakText({required String text}) async {
    await _tts.speak(text);
    return "";
  }

  // startHandler() => _tts.setStartHandler;
  stopHandler(fn) =>_tts.setCompletionHandler(fn);
  cancelHandler(fn) =>_tts.setCancelHandler(fn);


  stopSpeaking(){
    _tts.stop();
  }



}