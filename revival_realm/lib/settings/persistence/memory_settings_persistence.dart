import 'settings_persistence.dart';

/// An in-memory implementation of [SettingsPersistence].
/// Useful for testing.
class MemoryOnlySettingsPersistence implements SettingsPersistence {
  bool musicOn = true;

  bool soundsOn = true;

  bool audioOn = true;

  double musicVolume = 1.0;

  double soundsVolume = 1.0;

  String playerName = 'Player';

  @override
  Future<bool> getAudioOn({required bool defaultValue}) async => audioOn;

  @override
  Future<bool> getMusicOn({required bool defaultValue}) async => musicOn;

  @override
  Future<bool> getSoundsOn({required bool defaultValue}) async => soundsOn;

  @override
  Future<double> getMusicVolume({required double defaultValue}) async => musicVolume;

  @override
  Future<double> getSoundsVolume({required double defaultValue}) async => soundsVolume;

  @override
  Future<void> saveAudioOn(bool value) async => audioOn = value;

  @override
  Future<void> saveMusicOn(bool value) async => musicOn = value;

  @override
  Future<void> saveSoundsOn(bool value) async => soundsOn = value;

  @override
  Future<void> saveMusicVolume(double value) async => musicVolume = value;

  @override
  Future<void> saveSoundsVolume(double value) async => soundsVolume = value;
}