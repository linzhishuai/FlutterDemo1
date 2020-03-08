import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
  final String id;
  Detail(this.id);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("列表详情"),
      ),
      body: new Center(
        child:new Text('这是详情页面 详情 '+'id='+id),
      ),
    );
  }
}