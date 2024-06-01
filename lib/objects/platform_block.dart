import 'package:ember_quest/ember_quest.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

class PlatformBlock extends SpriteComponent
    with HasGameReference<EmberQuestGame>  {
  final Vector2 gridPosition;
  double xOffset;
  final Vector2 velocity = Vector2.zero();

  PlatformBlock({
    required this.gridPosition,
    required this.xOffset
}) : super (size: Vector2.all(64), anchor: Anchor.bottomLeft);

  @override
  void onLoad() {
    final platformImage = game.images.fromCache('block.png');
    sprite = Sprite(platformImage);
    position = Vector2((gridPosition.x * size.x) + xOffset,
      game.size.y - (gridPosition.y * size.y),
    );

    add(RectangleHitbox(
        collisionType: CollisionType.passive
    ));
  }

  /*
  * game loop is an infinite loop that calls all the objects in your game so you can
  * provide updates. The update method is the hook into this and it uses a double dt to pass to
  * your method the amount of time in seconds since it was last called. This dt variable then allows
  * to calculate how far the component needs to move on-screen.
  * */

  @override
 /*
* All that is happening is we define a base velocity that is instantiated at 0 on both axes
* and then we update velocity using the global objectSpeed variable for the x-axis. As
* this is our platform block, it will only scroll left and right, so our y-axis in the
* velocity will always be 0 as do not want our blocks jumping.

 */




  void update(double dt){
    velocity.x = game.objectSpeed;
    position += velocity * dt;
    if (position.x < -size.x) removeFromParent(); // this mean if x is on the left size of the screen, it will remove entirely platform block
    super.update(dt);
  }

}