import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: 'Cow Animation'),
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
  String animationName = 'init';

  void _getMilk() {
    setState(() {
      if (animationName == 'init') {
        animationName = 'first';
      } else if (animationName == 'first') {
        animationName = 'middle';
      } else if (animationName == 'middle') {
        animationName = 'last';
      } else {
        animationName = 'init';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        color: Color(0xffe0f2f1),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 450,
                height: 300,
                child: FlareActor(
                  'assets/cow_animation.flr',
                  animation: animationName,
                  alignment: Alignment.center,
                  fit: BoxFit.contain,
                ),
              ),
              RaisedButton(
                onPressed: _getMilk,
                child: Text(
                  'Get Milk',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
