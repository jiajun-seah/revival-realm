import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// import '../audio/audio_controller.dart';
// import '../audio/sounds.dart';
// import '../game_internals/level_state.dart';
import '../level_selection/levels.dart';
// import 'pixel.dart';
import '../levels/level_1.dart';
import '../levels/level_2.dart';
import '../levels/level_4.dart';

/// This widget defines the game UI itself, without things like the settings
/// button or the back button.
class GameWidget extends StatelessWidget {
  const GameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final level = context.watch<GameLevel>();
    // final levelState = context.watch<LevelState>();

    switch (level.id) {
      case 1:
        return Center(child: LevelOne());
      case 2:
        return Center(child: LevelTwo());
      case 4:
        return Center(child: LevelFour());
      default:
        return Center(child: LevelOne());
    }
  }
}
