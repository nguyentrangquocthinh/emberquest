import 'package:flame/components.dart';
import 'package:ember_quest/ember_quest.dart';

class EmberPlayer extends SpriteAnimationComponent
    with HasGameReference<EmberQuestGame> {
  EmberPlayer({
    required super.position,
  }) : super(
      size: Vector2.all(64),
      anchor: Anchor.center
  );

  /*
  *
  * This file uses the HasGameRef mixin which allows us to reach back to ember_quest.dart and
  * leverage any of the variables or methods that are defined in the game class.
  * You can see this in use with the line game.images.fromCache('ember.png').
  * Earlier, we loaded all the files into cache, so to use that file now, we call fromCache so it can be
  * leveraged by the SpriteAnimation. The EmberPlayer class is extending a SpriteAnimationComponent which
  * allows us to define animation as well as position it accordingly in our game world.
  * When we construct this class, the default size of Vector2.all(64) is defined as the size of
  * Ember in our game world should be 64x64. You may notice that in the animation SpriteAnimationData,
  * the textureSize is defined as Vector2.all(16) or 16x16. This is because the individual frame in our ember.png
  * is 16x16 and there are 4 frames in total. To define the speed of the animation, stepTime is used and set at 0.12
  * seconds per frame. You can change the stepTime to any length that makes the animation seem correct for your game vision.
  *
  * */



  @override
  void onLoad() {
    animation = SpriteAnimation.fromFrameData(
        game.images.fromCache('ember.png'),
      SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.12,
          textureSize: Vector2.all(16)
      )
    );
  }
}