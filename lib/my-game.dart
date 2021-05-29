import 'dart:ui';

import 'package:flame/game.dart';
import 'package:flame/game/base_game.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/cupertino.dart';

class MyGame extends BaseGame {
  // 屏幕尺寸
  Size screenSize;
  // 控制举行是否变色
  bool hasWon = false;
  // 组图的下标
  int count = 0;
  // 组图
  List<Sprite> girls = [
    Sprite('girl/1.png'),
    Sprite('girl/2.png'),
    Sprite('girl/3.png'),
    Sprite('girl/4.png'),
    Sprite('girl/5.png'),
    Sprite('girl/6.png'),
    Sprite('girl/7.png'),
    Sprite('girl/8.png'),
    Sprite('girl/9.png'),
    Sprite('girl/10.png'),
    Sprite('girl/11.png'),
    Sprite('girl/12.png'),
  ];
  // 帧
  int frame = 0;

  void render(Canvas canvas) {
    super.render(canvas);
    ///下面这段是给整个屏幕铺一层背景色
    Rect bgRect = Rect.fromLTWH(0, 0, screenSize.width, screenSize.height);
    Paint bgPaint = Paint();
    bgPaint.color = Color(0xfffbf8e7);
    canvas.drawRect(bgRect, bgPaint);

    ///下面这段注释得是在屏幕中央画一个白色得正方形
    // double screenCenterX = screenSize.width / 2;
    // double screenCenterY = screenSize.height / 2;
    // Rect boxRect = Rect.fromLTWH(
    //     screenCenterX - 75,
    //     screenCenterY - 75,
    //     150,
    //     150
    // );
    // Paint boxPaint = Paint();
    // // 通过hasWon得值可以改变正方形得颜色
    // if (hasWon) {
    //   boxPaint.color = Color(0xff00ff00);
    // } else {
    //   boxPaint.color = Color(0xffffffff);
    // }
    // canvas.drawRect(boxRect, boxPaint);

    ///通过canvas在屏幕指定位置渲染3个图
    canvas.drawImage(girls[count % 12].image, Offset(0, 0), Paint());
    canvas.drawImage(girls[count % 12].image, Offset((screenSize.width / 2) - 60, (screenSize.height / 2) - 100), Paint());
    canvas.drawImage(girls[count % 12].image, Offset(screenSize.width - 120, screenSize.height - 200), Paint());
  }

  ///用于监听用户是否触碰到正方形得区域
  void onTapDown(TapDownDetails d) {
    double screenCenterX = screenSize.width / 2;
    double screenCenterY = screenSize.height / 2;
    if (d.globalPosition.dx >= screenCenterX - 75
        && d.globalPosition.dx <= screenCenterX + 75
        && d.globalPosition.dy >= screenCenterY - 75
        && d.globalPosition.dy <= screenCenterY + 75
    ) {
      hasWon = !hasWon;
    }
  }

  void update(double t) {
    super.update(t);

    // 每5帧，图片下标+1
    if (frame % 5 == 0) {
      count++;
    }
    frame++;
  }

  void resize(Size size) {
    super.resize(size);
    screenSize = size;
  }
}