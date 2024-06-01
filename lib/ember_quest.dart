import 'package:ember_quest/actors/ember.dart';
import 'package:ember_quest/actors/water_enemy.dart';
import 'package:ember_quest/managers/segment_manager.dart';
import 'package:ember_quest/objects/ground_block.dart';
import 'package:ember_quest/objects/platform_block.dart';
import 'package:ember_quest/objects/star.dart';
import 'package:flame/game.dart';
import 'package:flame/components.dart';

class EmberQuestGame extends FlameGame {
  late EmberPlayer _ember;
  double objectSpeed = 0.0;

  EmberQuestGame();

  // loading assets for Ember displayed
  @override
  Future<void> onLoad() async {
    /*
     await images.loadAll()
    * take a list of the file name that are found in assets/images
    * and load them to cache
    */

    await images.loadAll([
      'block.png',
      'ember.png',
      'heart_half.png',
      'heart.png',
      'star.png',
      'water_enemy.png',
    ]);

    /*
    * using CameraComponent to move around in the world
    * */
    // Everything in this tutorial assumes that the position
    // of the `CameraComponent`s viewfinder (where the camera is looking)
    // is in the top left corner, that's why we set the anchor here.
    camera.viewfinder.anchor = Anchor.topLeft;
    initializeGame();

  }
//   loading segments into the world

  void loadGameSegments(int segmentIndex, double xPositionOffset) {
    for (final block in segments[segmentIndex]) {
      switch (block.blockType) {
        case GroundBlock:
        case PlatformBlock:
        case Star:
        case WaterEnemy:
        case PlatformBlock:
          add(PlatformBlock(
            gridPosition: block.gridPosition,
            xOffset: xPositionOffset,
          ));
      }
    }
  }

  void initializeGame() {
    final segmentsToLoad = (size.x / 640).ceil();
    segmentsToLoad.clamp(0, segments.length);

    for (var i = 0; i <= segmentsToLoad; i ++) {
      loadGameSegments(i, (640 * i).toDouble());
    }

    //   add Ember to the world
    _ember = EmberPlayer(
      position: Vector2(128, canvasSize.y - 70),
    );

    world.add(_ember);
  }
}



