import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';

import 'persistence/local_storage_settings_persistence.dart';
import 'persistence/settings_persistence.dart';

/// An class that holds settings like [musicOn] and [volume],
/// and saves them to an injected persistence store.
class SettingsController {
  static final _log = Logger('SettingsController');

  /// The persistence store that is used to save settings.
  final SettingsPersistence _store;

  /// Whether or not the audio is on at all. This overrides both music
  /// and sounds (sfx).
  ValueNotifier<bool> audioOn = ValueNotifier(true);

  /// The player's name. Used for things like high score lists.
  ValueNotifier<String> playerName = ValueNotifier('Player');

  /// Whether or not the sound effects (sfx) are on.
  ValueNotifier<bool> soundsOn = ValueNotifier(true);

  //Volume of sounds
  ValueNotifier<double> soundsVolume = ValueNotifier(1.0);

  /// Whether or not the music is on.
  ValueNotifier<bool> musicOn = ValueNotifier(true);

  //Volume of sounds
  ValueNotifier<double> musicVolume = ValueNotifier(1.0);

  /// Creates a new instance of [SettingsController] backed by [store].
  ///
  /// By default, settings are persisted using [LocalStorageSettingsPersistence]
  /// (i.e. NSUserDefaults on iOS, SharedPreferences on Android or
  /// local storage on the web).
  SettingsController({SettingsPersistence? store})
      : _store = store ?? LocalStorageSettingsPersistence() {
    _loadStateFromPersistence();
  }

  void toggleAudioOn() {
    audioOn.value = !audioOn.value;
    _store.saveAudioOn(audioOn.value);
  }

  void toggleMusicOn() {
    musicOn.value = !musicOn.value;
    _store.saveMusicOn(musicOn.value);
  }
  void setMusicVolume(val) {
    musicVolume.value = val;
    _store.saveMusicVolume(musicVolume.value);
  }

  void toggleSoundsOn() {
    soundsOn.value = !soundsOn.value;
    _store.saveSoundsOn(soundsOn.value);
  }
  void setSoundsVolume(val) {
    soundsVolume.value = val;
    _store.saveSoundsVolume(soundsVolume.value);
  }

  /// Asynchronously loads values from the injected persistence store.
  Future<void> _loadStateFromPersistence() async {
    final loadedValues = await Future.wait([
      _store.getAudioOn(defaultValue: true).then((value) {
        if (kIsWeb) {
          // On the web, sound can only start after user interaction, so
          // we start muted there on every game start.
          return audioOn.value = false;
        }
        // On other platforms, we can use the persisted value.
        return audioOn.value = value;
      }),
      _store
          .getSoundsOn(defaultValue: true)
          .then((value) => soundsOn.value = value),
      _store
          .getMusicOn(defaultValue: true)
          .then((value) => musicOn.value = value),
    ]);

    _log.fine(() => 'Loaded settings: $loadedValues');
  }
}