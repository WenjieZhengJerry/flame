import 'dart:ui';

import 'package:flame/components/component.dart';
import 'package:flame/components/mixins/resizable.dart';
import 'package:flame/gestures.dart';
import 'package:flame/game.dart';
import 'package:flame_flare/flame_flare.dart';
import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_controls.dart';

class BearGame extends BaseGame with TapDetector, DoubleTapDetector {
  final paint = Paint()..color = const Color(0xFFE5E5E5E5);
  final List<String> _animations = ['fail', 'success'];
  int _currentAnimation = 0;
  MinionComponent minionComponent;
  MinionController minionController;

  bool loaded = false;

  BearGame() {
    minionController = MinionController();
    minionComponent = MinionComponent(minionController);
    minionComponent.x = 0;
    minionComponent.y = 0;
    add(BGComponent());
    add(minionComponent);
    minionController.playStand();
  }

  @override
  bool debugMode() => true;

  @override
  void onTap() {
    minionController.playJump();
  }

  @override
  void onDoubleTap() {
    cycleAnimation();
  }

  void cycleAnimation() {
    if (_currentAnimation == 1) {
      _currentAnimation = 0;
    } else {
      _currentAnimation++;
    }
    minionController.play(_animations[_currentAnimation]);
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
  }
}

class MinionController extends FlareControls {
  void playStand() {
    play("fail");
  }

  void playDance() {
    play("test");
  }

  void playJump() {
    play("success");
  }

  void playWave() {
    play("idle");
  }
}

class MinionComponent extends FlareActorComponent with Resizable {
  MinionController minionController;

  MinionComponent(this.minionController)
      : super(
    FlareActorAnimation(
      'assets/images/Teddy.flr',
      controller: minionController,
      fit: BoxFit.scaleDown,
      alignment: Alignment.center,
    ),
    width: 100,
    height: 100,
  );

  @override
  void render(Canvas c) {
    final rect = Rect.fromLTWH(x, y, width, height);
    final paint = Paint()..color = const Color(0xFFfafbfc);
    c.drawRect(rect, paint);
    super.render(c);
  }

  @override
  void resize(Size size) {
    super.resize(size);

    x = size.width / 2 - width / 2;
    y = size.height / 2 - height / 2;
  }
}

class BGComponent extends Component with Resizable {
  @override
  void render(Canvas c) {
    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    final paint = Paint()..color = const Color(0xFFFFFFFF);
    c.drawRect(rect, paint);
  }

  @override
  void update(double t) {}
}
