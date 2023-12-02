import 'dart:collection';
import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:rhemabiblequiz/src/audio/songs.dart';
import 'package:rhemabiblequiz/src/audio/sounds.dart';
import 'package:rhemabiblequiz/src/settings/settings.dart';

class AudioController {
  static final _log = Logger('AudioController');

  AudioController({int polyphony = 2})
      : assert(polyphony >= 1),
        _musicPlayer = AudioPlayer(playerId: 'musicPlayer'),
        _sfxPlayers = Iterable.generate(
            polyphony,
            (i) => AudioPlayer(
                  playerId: 'sfxPlayer#$i',
                )).toList(growable: false),
        _playlist = Queue.of(
          List<Song>.of(songs)..shuffle(),
        ) {
    // onPlayerCompletion replaced by onPlayercomplete
    _musicPlayer.onPlayerComplete.listen(_changeSong);
  }
  void _changeSong(void _) {
    print("changesong from audio player called");
    _log.info('Last song finished playing.');
    // Put the song that just finished playing to the end of the playlist.
    _playlist.addLast(_playlist.removeFirst());
    // Play the next song.
    _log.info(() => 'Playing ${_playlist.first} now.');
    _musicPlayer.play(AssetSource(_playlist.first.filename));
  }

  String get songtitle => '${_playlist.first.artist!} ${_playlist.first.name}';
  AudioPlayer _musicPlayer;
  final List<AudioPlayer> _sfxPlayers;

  int _currentSfxPlayer = 0;
  final Queue<Song> _playlist;

  final Random _random = Random();

  SettingsController? _settings;
  // ValueNotifier<String> currentsongname=ValueNotifier(songtitle);
  ValueNotifier<AppLifecycleState>? _lifecycleNotifier;

  void attachLifecycleNotifier(
      ValueNotifier<AppLifecycleState> lifecycleNotifier) {
    // Remove previous ValueNotifier<AppLifecycleState>
    _lifecycleNotifier?.removeListener(_handleAppLifecycle);

    // Add a new ValueNotifier<AppLifecycleState>
    lifecycleNotifier.addListener(_handleAppLifecycle);
    //dispose of the previous lifecyleNotifier
    _lifecycleNotifier = lifecycleNotifier;
  }

  void attachSettings(SettingsController settingsController) {
    if (_settings == settingsController) {
      return;
    }
    final oldSettings = _settings;
    // Remove handlers from the old settings controller if present
    if (oldSettings != null) {
      oldSettings.muted.removeListener(_mutedHandler);
      oldSettings.musicOn.removeListener(_musicOnHandler);
      oldSettings.soundsOn.removeListener(_soundOnHandler);
    }
    _settings = settingsController;

    settingsController.muted.addListener(_mutedHandler);
    settingsController.musicOn.addListener(_musicOnHandler);
    settingsController.soundsOn.addListener(_soundOnHandler);

    if (!settingsController.muted.value && settingsController.musicOn.value) {
      _startMusic();
    }
  }

  void dispose() {
    _lifecycleNotifier?.removeListener(_handleAppLifecycle);
    _stopAllSound();
    _musicPlayer.dispose();
    for (final players in _sfxPlayers) {
      players.dispose();
    }
  }

// TODO: NO NEED OF THIS FUNCTION
  Future<void> initialize() async {
    _log.info('Preloading sound effects');
  }

  void playSfx(SfxType type) {
    final muted = _settings?.muted.value ?? true;
    if (muted) {
      _log.info(() => 'Ignoring playing sound($type) because audio is muted. ');
      return;
    }
    final soundOn = _settings?.soundsOn.value ?? false;

    if (!soundOn) {
      _log.info(
          () => 'Ignoring playing sound($type) because sounds are turned off.');
      return;
    }
    final usedthisSfxPlayer = _sfxPlayers[_currentSfxPlayer];

    _log.info(() => 'Playing sounds $type');
    final options = soundTypeToFilename(type);
    final filename = options[_random.nextInt(options.length)];
    _log.info(() => '- Chosen filename:$filename');
    usedthisSfxPlayer.play(AssetSource(filename),
        volume: soundTypeToVolume(type));
    _currentSfxPlayer = (_currentSfxPlayer + 1) % _sfxPlayers.length;
    // TODO: CHECK THIS
    print(_currentSfxPlayer);
    // _sfxPlayers[_currentSfxPlayer];
  }

  void _handleAppLifecycle() {
    switch (_lifecycleNotifier!.value) {
      case AppLifecycleState.paused:
      case AppLifecycleState.detached:
      case AppLifecycleState.hidden:
        _stopAllSound();
        break;
      case AppLifecycleState.resumed:
        if (!_settings!.muted.value && _settings!.musicOn.value) {
          _resumeMusic();
        }
        break;
      case AppLifecycleState.inactive:
        // No need to react to this state change.
        break;
    }
  }

  void _musicOnHandler() {
    // if musicOn is true
    if (_settings!.musicOn.value) {
      // Music got turned on.
      // if muted is false
      if (!_settings!.muted.value) {
        _resumeMusic();
      }
    } else {
      // Music got turned off.
      _stopMusic();
    }
  }

  void _mutedHandler() {
    // muted true
    if (_settings!.muted.value) {
      // All sound just got muted.
      _stopAllSound();
    } else {
      // All sound just got un-muted.
      // musicOn is true
      if (_settings!.musicOn.value) {
        _resumeMusic();
      }
    }
  }

  Future<void> _resumeMusic() async {
    _log.info("Resuming music");
    switch (_musicPlayer.state) {
      case PlayerState.paused:
        _log.info('Calling _musicPlayer.resume()');
        try {
          await _musicPlayer.resume();
        } catch (e) {
          // Sometimes, resuming fails with an "Unexpected" error.
          _log.severe(e);
          await _musicPlayer.play(AssetSource(_playlist.first.filename));
        }
        break;
      case PlayerState.stopped:
        _log.info("resumeMusic() called when music is stopped. "
            "This probably means we haven't yet started the music. "
            "For example, the game was started with sound off.");
        await _musicPlayer.play(AssetSource(_playlist.first.filename));

        break;
      case PlayerState.playing:
        _log.warning('resumeMusic() called when music is playing. '
            'Nothing to do.');
        break;

      case PlayerState.completed:
        _log.warning('resumeMusic() called when music is completed. '
            "Music should never be 'completed' as it's either not playing "
            "or looping forever.");
        await _musicPlayer.play(AssetSource(_playlist.first.filename));
        break;
      case PlayerState.disposed:
        _log.info('Player is disposed. Reinitializing.');
        _musicPlayer = AudioPlayer();
        // You may need to set up the player again (e.g., set listeners, configuration) depending on your implementation.
        await _musicPlayer.play(AssetSource(_playlist.first.filename));
        break;
    }
  }

  void _soundOnHandler() {
    for (final player in _sfxPlayers) {
      if (player.state == PlayerState.playing) {
        player.stop();
      }
    }
  }

  void _startMusic() {
    _log.info('starting music');
    _musicPlayer.play(AssetSource(_playlist.first.filename));
  }

  void _stopAllSound() {
    if (_musicPlayer.state == PlayerState.playing) {
      _musicPlayer.pause();
    }
    for (final player in _sfxPlayers) {
      player.stop();
    }
  }

  void _stopMusic() {
    _log.info('Stopping music');
    if (_musicPlayer.state == PlayerState.playing) {
      _musicPlayer.pause();
    }
  }
}
