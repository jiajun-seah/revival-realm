import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../audio/audio_controller.dart';
import '../audio/sounds.dart';

import '../game_internals/level_state.dart';
import '../play_session/food.dart';

/// This widget defines the game UI itself, without things like the settings
/// button or the back button.
class LevelThree extends StatelessWidget {
  const LevelThree({super.key});

  @override
  Widget build(BuildContext context) {
    final levelState = context.watch<LevelState>();
    final audioController = context.watch<AudioController>();
    
    return Column(
        children: [
          Expanded(
            child: Row(children: [
              Flexible(
                flex: 1,
                child: Center(
                  child: AspectRatio(
                    aspectRatio: 1/1,
                    child: Stack (
                      children: [
                        Container(
                          alignment: Alignment.topCenter,
                          child: FractionallySizedBox(
                            widthFactor: 0.9,
                            heightFactor: 0.45,
                              child: LayoutBuilder(
                                builder: (context, constraints) => Visibility(
                                  visible: !levelState.checkDropped('banana'),
                                  child: Draggable<String>(
                                    data: 'banana',
                                    feedback: Container(
                                      width: constraints.maxWidth*1.05,
                                      child: Food(
                                      name: 'banana',
                                      relativeWidth: 1.0,
                                      relativeHeight: 0.5,
                                      sprite: Image.asset('assets/images/foods/Banana.gif')
                                    )),
                                    childWhenDragging: Container(),
                                    child: Food(
                                      name: 'banana',
                                      relativeWidth: 1.0,
                                      relativeHeight: 0.5,
                                      sprite: Image.asset('assets/images/foods/Banana.gif')
                                    ),
                                  ),
                                ),
                              ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.bottomCenter,
                          child: FractionallySizedBox(
                            heightFactor: 0.45,
                            child: LayoutBuilder(
                                builder: (context, constraints) => Visibility(
                                  visible: !levelState.checkDropped('orange_r'),
                                  child: Draggable<String>(
                                    data: 'orange_r',
                                    feedback: Container(
                                      width: constraints.maxWidth*0.475,
                                      child: Food(
                                      name: 'orange_r',
                                      relativeWidth: 0.5,
                                      relativeHeight: 0.5,
                                      sprite: Image.asset('assets/images/foods/Orange_r.gif')
                                    )),
                                    childWhenDragging: Container(),
                                    child: Food(
                                      name: 'orange_r',
                                      relativeWidth: 0.5,
                                      relativeHeight: 0.5,
                                      sprite: Image.asset('assets/images/foods/Orange_r.gif')
                                    ),
                                  ),
                                ),
                              ),
                            ),
                        ),
                      ],)
                  ),
                ),
              ),
              Flexible(
                flex:1,
                child: Center(
                  child: AspectRatio(
                    aspectRatio: 1/1,
                    child: Stack(
                      children: [
                        Image.asset('assets/images/foods/level_3_board.png'),
                        Container(
                          alignment: const Alignment(-0.75,-0.5),
                          child: FractionallySizedBox(
                            widthFactor: 0.45,
                            heightFactor: 0.45,
                            child: DragTarget<String>(
                              builder: (
                                BuildContext context,
                                List<dynamic> accepted,
                                List<dynamic> rejected,
                              ) {
                                return Container(
                                  // color: Colors.blue,
                                  child: Image.asset(levelState.checkDropped('orange_l')
                                    ? 'assets/images/foods/Orange_l.gif'
                                    : 'assets/images/foods/transparent_square.png')
                                );
                              },
                              onWillAccept: (data) {
                                return data == 'orange_l';
                              },
                              onAccept: (data) {
                                audioController.playSfx(SfxType.pop);
                                levelState.setProgress('orange_l');
                                levelState.evaluate();
                              },
                            ),
                          ),
                        ),
                        Container(
                          alignment: const Alignment(0.75, -0.5),
                          child: FractionallySizedBox(
                            widthFactor: 0.45,
                            heightFactor: 0.45,
                            child: DragTarget<String>(
                              builder: (
                                BuildContext context,
                                List<dynamic> accepted,
                                List<dynamic> rejected,
                              ) {
                                return Container(
                                  // color: Colors.blue,
                                  child: Image.asset(levelState.checkDropped('orange_r')
                                    ? 'assets/images/foods/Orange_r.gif'
                                    : 'assets/images/foods/transparent_square.png')
                                );
                              },
                              onWillAccept: (data) {
                                return data == 'orange_r';
                              },
                              onAccept: (data) {
                                audioController.playSfx(SfxType.pop);
                                levelState.setProgress('orange_r');
                                levelState.evaluate();
                              },
                            ),
                          ),
                        ),
                        Container(
                          alignment: const Alignment(0, 0.75),
                          child: FractionallySizedBox(
                            widthFactor: 0.9,
                            heightFactor: 0.45,
                            child: DragTarget<String>(
                              builder: (
                                BuildContext context,
                                List<dynamic> accepted,
                                List<dynamic> rejected,
                              ) {
                                return Container(
                                  child: Image.asset(levelState.checkDropped('banana')
                                    ? 'assets/images/foods/Banana.gif'
                                    : 'assets/images/foods/transparent_square.png')
                                );
                              },
                              onWillAccept: (data) {
                                return data == 'banana';
                              },
                              onAccept: (data) {
                                audioController.playSfx(SfxType.pop);
                                levelState.setProgress('banana');
                                levelState.evaluate();
                              },
                            ),
                          ),
                        ),
                        Container(
                          alignment: const Alignment(0.0, 0.15),
                          child: FractionallySizedBox(
                            widthFactor: 0.15,
                            heightFactor: 0.15,
                            child: DragTarget<String>(
                              builder: (
                                BuildContext context,
                                List<dynamic> accepted,
                                List<dynamic> rejected,
                              ) {
                                return Container(
                                  child: Image.asset(levelState.checkDropped('blueberry')
                                    ? 'assets/images/foods/Blueberry.gif'
                                    : 'assets/images/foods/transparent_square.png')
                                );
                              },
                              onWillAccept: (data) {
                                return data == 'blueberry';
                              },
                              onAccept: (data) {
                                audioController.playSfx(SfxType.pop);
                                levelState.setProgress('blueberry');
                                levelState.evaluate();
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Center(
                  child: AspectRatio(
                    aspectRatio: 1/1,
                    child: Stack (
                      children: [
                        Container(
                          alignment: Alignment.topCenter,
                          child: FractionallySizedBox(
                            heightFactor: 0.45,
                            child: LayoutBuilder(
                                builder: (context, constraints) => Visibility(
                                  visible: !levelState.checkDropped('orange_l'),
                                  child: Draggable<String>(
                                    data: 'orange_l',
                                    feedback: Container(
                                      width: constraints.maxWidth*0.475,
                                      child: Food(
                                      name: 'orange_l',
                                      relativeWidth: 0.5,
                                      relativeHeight: 0.5,
                                      sprite: Image.asset('assets/images/foods/Orange_l.gif')
                                    )),
                                    childWhenDragging: Container(),
                                    child: Food(
                                      name: 'orange_l',
                                      relativeWidth: 0.5,
                                      relativeHeight: 0.5,
                                      sprite: Image.asset('assets/images/foods/Orange_l.gif')
                                    ),
                                  ),
                                ),
                              ),
                            ),
                        ),
                        Container(
                          alignment: Alignment.bottomCenter,
                          child: FractionallySizedBox(
                            heightFactor: 0.15,
                            child: LayoutBuilder(
                                builder: (context, constraints) => Visibility(
                                  visible: !levelState.checkDropped('blueberry'),
                                  child: Draggable<String>(
                                    data: 'blueberry',
                                    feedback: Container(
                                      width: constraints.maxWidth*.175,
                                      child: Food(
                                      name: 'blueberry',
                                      relativeWidth: 0.5,
                                      relativeHeight: 0.5,
                                      sprite: Image.asset('assets/images/foods/Blueberry.gif')
                                    )),
                                    childWhenDragging: Container(),
                                    child: Food(
                                      name: 'blueberry',
                                      relativeWidth: 0.5,
                                      relativeHeight: 0.5,
                                      sprite: Image.asset('assets/images/foods/Blueberry.gif')
                                    ),
                                  ),
                                ),
                              ),
                            ),
                        ),
                      ],)
                  ),
                ),
              ),
            ],),
          )
        ],
      );
  }
}
