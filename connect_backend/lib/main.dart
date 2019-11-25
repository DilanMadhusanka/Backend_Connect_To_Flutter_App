import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

List data;

void main() async {
  data = await getData();
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
            new Container(
              height: 500,
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
              // child: Text("data"),
            ),
            new RaisedButton(
              onPressed: () {
                debugPrint("${data[1]}");
              },
            )
          ],
        ),
      ),
    );
  }
}

Future<List> getData() async {
  String apiUrl = "http://10.0.2.2:8080/contact";
  http.Response response = await http.get(apiUrl);
  
  return json.decode(response.body);

}