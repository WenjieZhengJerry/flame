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
    'girl/12.png',
    // 'girl2/1.png',
    'girl2/2.png',
    'girl2/3.png',
    'girl2/4.png',
    'girl2/5.png',
    'girl2/6.png',
    'girl2/7.png',
    'girl2/8.png',
    'girl2/9.png',
    'girl2/10.png',
  ]);


  runApp(MyApp());
}

///到时研究一下怎么把动画嵌入到wight中
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // Util flameUtil = Util();
    // MyGame myGame = MyGame();
    ///下面三行是监听用户手势并绑定事件
    // TapGestureRecognizer tapper = TapGestureRecognizer();
    // tapper.onTapDown = myGame.onTapDown;
    // flameUtil.addGestureRecognizer(tapper);
    // return myGame.widget;

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: '普通gif和Flame动画的对比'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  MyGame myGame = MyGame();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        color: Color(0xfffbf8e7),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('普通gif'),
              Container(
                  width: 200,
                  height: 200,
                  child: Image.network('https://5b0988e595225.cdn.sohucs.com/q_mini,c_zoom,w_640/images/20171007/f1cfa788964748a6b932b75c68954f26.gif')
              ),
              Text('Flame引擎做的动画'),
              Container(
                width: 120,
                height: 200,
                color: Color(0xfffbf8e7),
                child: myGame.widget,
              ),
            ],
          ),
        ),
      )
    );
  }
}