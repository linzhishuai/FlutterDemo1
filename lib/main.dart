import 'package:flutter/material.dart';

import 'package:demo20200308/views/firstPage.dart';
import 'package:demo20200308/views/secondPage.dart';
import 'package:demo20200308/views/thirdPage.dart';
import 'package:demo20200308/views/detail.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      // routes: <String,WidgetBuilder>{
      //   '/detail':(BuildContext context) => new Detail()
      // },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  TabController tabController;
  @override
  void initState(){
    tabController = new TabController(length: 3, vsync: this);
  }

  @override
  void dispose(){
    tabController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new TabBarView(
        controller: tabController,
        children: <Widget>[
          new FirstPage(),
          new SecondPage(),
          new ThirdPage(),
        ]
      ),
      bottomNavigationBar: new Material(
        color:Colors.orangeAccent,
        child:new TabBar(
          controller:tabController,
          tabs:<Tab>[
            new Tab(text: "列表",icon: new Icon(Icons.home)),
            new Tab(text: "通知",icon: new Icon(Icons.message)),
            new Tab(text: "我的",icon: new Icon(Icons.cloud)),
          ]
        )
      ),
    );
  }
}