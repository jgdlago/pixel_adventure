import 'package:pixel_adventure/components/collision_block.dart';
import 'package:pixel_adventure/components/player.dart';

bool checkCollision(Player player, CollisionBlock block) {

  final fixedX = player.scale.x < 0 ? player.position.x - player.width : player.position.x;

  return (player.position.y < block.position.y + block.height
      && player.position.y + player.height > block.position.y
      && fixedX < block.position.x + block.width
      && fixedX + player.width > block.position.x
  );
}