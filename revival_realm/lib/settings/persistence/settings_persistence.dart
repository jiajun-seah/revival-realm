// Copyright 2022, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// An interface of persistence stores for settings.
///
/// Implementations can range from simple in-memory storage through
/// local preferences to cloud-based solutions.
abstract class SettingsPersistence {
  Future<bool> getAudioOn({required bool defaultValue});

  Future<bool> getMusicOn({required bool defaultValue});

  Future<bool> getSoundsOn({required bool defaultValue});

  Future<double> getMusicVolume({required double defaultValue});

  Future<double> getSoundsVolume({required double defaultValue});

  Future<void> saveAudioOn(bool value);

  Future<void> saveMusicOn(bool value);

  Future<void> saveSoundsOn(bool value);

  Future<void> saveMusicVolume(double value);

  Future<void> saveSoundsVolume(double value);
}