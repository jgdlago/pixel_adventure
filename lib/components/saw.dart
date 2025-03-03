import 'dart:async';

import 'package:flame/components.dart';
import 'package:pixel_adventure/pixel_adventure.dart';

class Saw extends SpriteAnimationComponent with HasGameRef<PixelAdventure> {
  final bool isVertical;
  final double offNeg;
  final double offPos;

  Saw({
    this.isVertical = false,
    this.offNeg = 0,
    this.offPos = 0,
    position,
    size
  }) : super(
    position: position,
    size: size
  );

  static const double sawSpeed = 0.03;
  static const int moveSpeed = 50;
  static const int tileSize = 16;
  double moveDirection = 1;
  double rangeNeg = 0;
  double rangePos = 0;

  @override
  FutureOr<void> onLoad() {
    priority = -1;

    if (isVertical) {
      rangeNeg = position.y - offNeg * tileSize;
      rangePos = position.y + offPos * tileSize;
    } else {
      rangeNeg = position.x - offNeg * tileSize;
      rangePos = position.x + offPos * tileSize;
    }

    animation = SpriteAnimation.fromFrameData(
      game.images.fromCache(
        'Traps/Saw/On_(38x38).png'),
        SpriteAnimationData.sequenced(
            amount: 8,
            stepTime: sawSpeed,
            textureSize: Vector2.all(38)
        )
      );
    return super.onLoad();
  }

  @override
  void update(double dt) {
    if (isVertical) {
      position.y += moveDirection * moveSpeed * dt;

      if (position.y <= rangeNeg || position.y >= rangePos) {
        moveDirection *= -1;
      }
    } else {
      position.x += moveDirection * moveSpeed * dt;

      if (position.x <= rangeNeg || position.x >= rangePos) {
        moveDirection *= -1;
      }
    }
    super.update(dt);
  }
}