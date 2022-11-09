import 'package:assets_audio_player/assets_audio_player.dart';


class AudioPlayerService{
  static final AudioPlayerService _service = AudioPlayerService._internal();
  factory AudioPlayerService() => _service;
  AudioPlayerService._internal();



  final AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();

  playAudio(String filePath) async {
    if(assetsAudioPlayer.isPlaying.value) {
      assetsAudioPlayer.stop();
    }
    assetsAudioPlayer.open(
      Audio(filePath),
      playInBackground: PlayInBackground.enabled,
      respectSilentMode: true,
      volume: 1,
    );
  }

  stopAudio(){
    assetsAudioPlayer.stop();
  }

}