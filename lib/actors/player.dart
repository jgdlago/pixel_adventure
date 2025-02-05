import 'dart:async';

import 'package:flame/components.dart';
import 'package:pixel_adventure/pixel_adventure.dart';

enum PlayerState {
  idle,
  running
}

class Player extends SpriteAnimationGroupComponent with HasGameRef<PixelAdventure> {
  late final SpriteAnimation idleAnimation;
  final double stepTime = 0.05;

  @override
  FutureOr<void> onLoad() {
    _loadAllAnimations();
    return super.onLoad();
  }

  void _loadAllAnimations() {
    idleAnimation = SpriteAnimation.fromFrameData(
        game.images.fromCache('Main_Characters/Ninja_Frog/Idle_(32x32).png'),
        SpriteAnimationData.sequenced(
            amount: 11,
            stepTime: stepTime,
            textureSize: Vector2.all(32)
        )
    );

    animations = { PlayerState.idle: idleAnimation }; // Lista de animações

    current = PlayerState.idle; // Animação atual
  }
}