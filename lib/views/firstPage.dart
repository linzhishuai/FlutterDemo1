import 'package:flutter/material.dart';
import 'package:demo20200308/components/list.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title:new Text("界面1"),
      ),
      // body: new Center(
      //   child: new Text("这是第一个界面"),
      // ),
      body: new Container(
        child:new List(),
      ),
    );
  }
}