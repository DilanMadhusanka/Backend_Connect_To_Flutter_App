import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



void main() async {
  
  runApp(new MaterialApp(
    title: 'Spring',
    home: new Home(),
  ));
}



class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  List data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Conneting to Database'),
      ),
      body: new Container(
        child: new ListView(
          children: <Widget>[
            Container(
              child: displayResult(),
            ),
            new RaisedButton(
              child: new Text('Ok'),
              onPressed: () {
                getData();
              },
            )
          ],
        ),
      ),
    );
  }
  
Future<List> getData() async {
  String apiUrl = "http://10.0.2.2:8080/contact";
  http.Response response = await http.get(apiUrl);
  setState(() {
    data =  json.decode(response.body);
  });
  return json.decode(response.body);

}
Widget displayResult() {
  
  if(data == null){
    return Container();
  }else{
    return Container(
          height: MediaQuery.of(context).size.height -160,
              child: new ListView.builder(
                itemCount: data.length,
                padding: const EdgeInsets.all(15.0),
                itemBuilder: (BuildContext context, int position) {
                  return new Card(
                    child: new ListTile(
                      title: new Text("${data[position]}"),
                    ),
                  );
                },
              ),
        );
  }
  
}
}

