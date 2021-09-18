import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jsonapi/model/loadData.dart';

Future<LoadData> apiCall() async {
  final response = await http
      .get('https://raw.githubusercontent.com/buz-adam/NewApi/main/data.json');
  if (response.statusCode == 200) {
    var Json = json.decode(response.body);
    var n_json = Json['data'];
    var nm = n_json[0];
    //liste içinde liste yapıp dondurmek gerekli
    return LoadData.fromJson(nm);
  } else {
    throw Exception('Failed to load');
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Json API'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<LoadData>(
        future: apiCall(),
        // ignore: missing_return
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
                child: Center(
                    child: Text(
              "Kullanıcı Adı: ${snapshot.data.area} \n" +
                  "E Posta: ${snapshot.data.city}",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.orange),
            )));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
