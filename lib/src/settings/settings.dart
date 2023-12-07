import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:rhemabiblequiz/src/settings/persistence/settings_persistence.dart';

class SettingsController {
  // static final SettingsController _SettingsController = ;

  factory SettingsController({required SettingsPersistence persistence}) {
    return SettingsController._internal(persistence: persistence);
  }

  SettingsController._internal({required SettingsPersistence persistence})
      : _persistence = persistence;

  /// Whether or not the sound is on at all. This overrides both music and sound.
  ValueNotifier<bool> muted = ValueNotifier(false);
  ValueNotifier<String> playerName = ValueNotifier('New Player');
  ValueNotifier<bool> soundsOn = ValueNotifier(false);
  bool isSoundson = false;
  ValueNotifier<bool> musicOn = ValueNotifier(false);

  // /// Creates a new instance of [SettingsController] backed by [persistence].
  // SettingsController({required SettingsPersistence persistence})
  //     : _persistence = persistence;

  final SettingsPersistence _persistence;

  /// Asynchronously loads values from the injected persistence store.
  Future<void> loadStateFromPersistence() async {
    await Future.wait([
      // if its web getmuted is false
      _persistence
          .getMuted(defaultValue: kIsWeb)
          .then((value) => muted.value = value),
      _persistence.getSoundsOn().then((value) {
        soundsOn.value = value;
        isSoundson = value;
        // notifyListeners();
      }),
      _persistence.getMusicOn().then((value) => musicOn.value = value),
      _persistence.getPlayerName().then((value) => playerName.value = value),
    ]);
  }

  void setPlayerName(String name) {
    playerName.value = name;
    _persistence.savePlayerName(playerName.value);
  }

  void toggleMusicOn() {
    print('Music toggle');

    musicOn.value = !musicOn.value;
    if (musicOn.value == true) {
      muted.value = false;
    }
    _persistence.saveMusicOn(musicOn.value);
  }

  void toggleMuted() {
    print('Musted toggle');

    muted.value = !muted.value;
    if (muted.value == true) {
      musicOn.value = false;
      soundsOn.value = false;
    }

    _persistence.saveMuted(muted.value);
  }

  void toggleSoundsOn() {
    print('Sound toggle');

    soundsOn.value = !soundsOn.value;
    print('soundsOn.value=${soundsOn.value} mutted ${muted.value}');
    if (soundsOn.value == true && muted.value == true) {
      // muted.value = true;
      toggleMuted();
      // toggleMusicOn();
    }
    _persistence.saveSoundOn(soundsOn.value);
  }

  void setOthervalue(bool value, String name) {}
}
