import 'package:flutter/material.dart';
import 'package:demo20200308/components/input.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {

  TextEditingController textEditingController;
  String active = 'text';
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("界面2"),
      ),
      // body: new Center(
      //   child: new Text("这是第二个界面"),
      // ),
      body: new Container(
        child: new Column(
          children: <Widget>[
            new TextField(
              controller: textEditingController ,
              onChanged: _onChanged,
          ),
          new Input(active:active),
          ],
        )
      ),
    );
  }

  void _onChanged(String value){
    setState(() {
      active = value;
    });
  }
}