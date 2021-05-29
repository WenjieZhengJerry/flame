import 'dart:ui';
import 'package:flame/game.dart';
import 'package:flame/components/component.dart';
import 'package:flame/game/base_game.dart';
import 'package:flame/sprite.dart';

class MyGame extends BaseGame {
  Size screenSize;

  // MyGame() {
  //   add(MyCrate());
  // }

  void render(Canvas canvas) {
    super.render(canvas);
  }

  void update(double t) {
    super.update(t);
  }

  void resize(Size size) {
    super.resize(size);
  }
}

// class MyCrate extends SpriteComponent {
//   // 创建一个可以渲染图片"man.png"的sprite（精灵），并设定其尺寸为16×16
//   MyCrate() : super.fromSprite(16.0, 16.0, Sprite('man.png'));
//
//   @override
//   void resize(Size size) {
//     // 我们不需要在构造函数中定义x和y的值，我们可以在这里定义：
//     this.x = (size.width - this.width) / 2;
//     this.y = (size.height - this.height) / 2;
//   }
// }