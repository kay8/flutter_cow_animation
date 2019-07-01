import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
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
  int _index = 0;
  List _animationNames = ['init', 'first', 'middle', 'last'];

  void _getMilk() {
    setState(() {
      _index = _index + 1 < _animationNames.length ? _index + 1 : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        color: Color(0xffFFECB3),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 450,
                height: 300,
                child: FlareActor(
                  'assets/cow_animation.flr',
                  animation: _animationNames[_index],
                  alignment: Alignment.center,
                  fit: BoxFit.contain,
                ),
              ),
              FlatButton(
                color: Colors.teal,
                onPressed: _getMilk,
                child: Text(
                  'Get Milk',
                  style: TextStyle(
                    fontSize: 14.0,
                    letterSpacing: 0.75,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
