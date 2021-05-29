import 'package:flame/util.dart';
import 'package:flame_demo/my-game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Util flameUtil = Util();
  await flameUtil.fullScreen();
  await flameUtil.setOrientation(DeviceOrientation.portraitUp);

  MyGame myGame = MyGame();
  runApp(myGame.widget);
}
