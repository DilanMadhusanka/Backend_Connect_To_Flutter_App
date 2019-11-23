import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() async {
  String _data = await _getData();
  print(_data);
  runApp(new MaterialApp(
    title: 'Spring',
    home: new Home(),
  ));
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Conneting to Database'),
      ),
      body: new Container(
        child: new ListView(
          children: <Widget>[
            new RaisedButton(
              onPressed: () {
                
              },
            )
          ],
        ),
      ),
    );
  }
}

Future<String> _getData() async {
  String apiUrl = "http://10.0.2.2:8080/contact";
  http.Response response = await http.get(apiUrl);
  
  return json.decode(response.body).toString();

}