import 'package:coffee_place/app/core/constants/app_assets.dart';
import 'package:just_audio/just_audio.dart';

class HomeService {
  HomeService();

  Future<List<(String title, AudioPlayer player)>> getAudioPlayers() async {
    return [
      (
        'Chuva (Fraca)',
        AudioPlayer()
          ..setLoopMode(LoopMode.one)
          ..setUrl(AppAssets.externalAudio.rainInsideCar)
          ..setVolume(0.7),
      ),
      (
        'Lareira',
        AudioPlayer()
          ..setLoopMode(LoopMode.one)
          ..setUrl(AppAssets.externalAudio.fireplace)
          ..setVolume(0.5),
      ),
      (
        'Pessoas',
        AudioPlayer()
          ..setUrl(AppAssets.externalAudio.coffeeShop)
          ..setVolume(0.7),
      ),
      (
        'Chuva (Forte)',
        AudioPlayer()
          ..setLoopMode(LoopMode.one)
          ..setUrl(AppAssets.externalAudio.rainStrong)
          ..setVolume(0.2),
      ),
      // (
      //   'Praia',
      //   AudioPlayer()
      //     ..setUrl(AppAssets.externalAudio.waterOceanWaves)
      //     ..setVolume(0.5),
      // ),
    ];
  }
}
