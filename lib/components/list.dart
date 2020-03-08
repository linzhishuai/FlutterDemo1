import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:demo20200308/views/detail.dart';
class List extends StatefulWidget {

  @override
  _ListState createState() => _ListState();
}

class _ListState extends State<List> {
  var data;
  
  getData() async{
    var url = 'https://jsonplaceholder.typicode.com/posts';
    var httpClient = new HttpClient();

    var result ;

    try {
      var request = await httpClient.getUrl(Uri.parse(url));
      var response = await request.close();
      if(response.statusCode == HttpStatus.ok){
        var json = await response.transform(utf8.decoder).join();
        result = jsonDecode(json);
      }else{
        result = 'Error getting JSON data:\n Http status ${response.statusCode}';
      }
    }catch(exception){
      result = "Failed get JSON data";
    }

    if(!mounted) return;

    setState(() {
      data = result;
      // print(data);
    });
}

  @override
  Widget build(BuildContext context) {
    getData();
    return new ListView.builder(
      itemCount: data == null ? 0 : data.length,
      itemBuilder: (BuildContext context,int index){
        return new Card(
          child: new Container(
            padding: new EdgeInsets.all(10.0),
            child: new ListTile(
              subtitle: new Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        new Expanded(
                          child: new Text(
                              data[index]["title"],
                              style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 16.0)
                          ),
                        )
                      ],
                  ),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:[
                      new Text("时间： "),
                      new Text("2012-12-12 12:12"),
                    ]
                  ),
                  new Row(
                    children: <Widget>[
                      new Container(
                        padding:const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 2.0),
                        child: new Text(
                          'id: ' + data[index]["id"].toString()
                          ),
                      )
                    ],
                  ),
                ],
              ),
              trailing: new Icon(Icons.keyboard_arrow_right,color:Colors.grey),
              onTap: () => _onTap(data[index]["id"].toString()),
            ),
          ),
        );
      },
      
    );
  }
  
  void _onTap(String id){
    Navigator.of(context).push(new PageRouteBuilder(
      opaque: false,
      pageBuilder: (BuildContext context, _,__){
        return new Detail(id);
      },
      ///transition就是过度动画（现在不用管，反正这段代码都是官方的）
      transitionsBuilder: (_,Animation<double> animation,__,Widget child){
         return new FadeTransition(
             opacity: animation,
           child: new SlideTransition(position: new Tween<Offset>(
             begin: const Offset(0.0, 1.0),
             end: Offset.zero,
           ).animate(animation),child: child,
           ),
         ) ;
      }
    ));
  }
}
