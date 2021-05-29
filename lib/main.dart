import 'package:flame/flame.dart';
import 'package:flame/util.dart';
import 'package:flame_demo/my-game.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  ///这四行是干嘛的不大清楚，锁定屏幕和全屏化
  WidgetsFlutterBinding.ensureInitialized();
  Util flameUtil = Util();
  await flameUtil.fullScreen();
  await flameUtil.setOrientation(DeviceOrientation.portraitUp);
  ///导入图片
  Flame.images.loadAll(<String>[
    'man.jpg',
    'girl/1.png',
    'girl/2.png',
    'girl/3.png',
    'girl/4.png',
    'girl/5.png',
    'girl/6.png',
    'girl/7.png',
    'girl/8.png',
    'girl/9.png',
    'girl/10.png',
    'girl/11.png',
    'girl/12.png'
  ]);

  MyGame myGame = MyGame();
  ///下面三行是监听用户手势并绑定事件
  TapGestureRecognizer tapper = TapGestureRecognizer();
  tapper.onTapDown = myGame.onTapDown;
  flameUtil.addGestureRecognizer(tapper);

  runApp(myGame.widget);
}

///到时研究一下怎么把动画嵌入到wight中
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);
//
//   final String title;
//
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   MyGame myGame = MyGame();
//   int _counter = 0;
//
//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Container(
//               height: 200,
//               width: 200,
//               color: Colors.blue,
//               child: myGame.widget
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headline4,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }