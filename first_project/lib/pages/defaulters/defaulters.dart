import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:first_project/networking/ApiProvider.dart';
import 'package:first_project/models/Defaulter.dart';

Future<List<Defaulter>> _getData() async {
  final response =
      await http.get('https://dev.sortstring.in/api/defaulter-list');

  if (response.statusCode == 200) {
    final jsonResponse = json.decode(response.body);
    List<Defaulter> defaulters = List();
    for (var data in jsonResponse) {
      defaulters.add(Defaulter.fromJson(data));
      // print(data);
    }
    // defaulters = jsonResponse
    //     .map<Defaulter>((json) => Defaulter.fromJson(json))
    //     .toList();

    // print(defaulters[0].schedule_amount);
    return defaulters;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load list');
  }
}

class Dafaulter extends StatefulWidget {
  @override
  _DafaulterState createState() => _DafaulterState();
}

class _DafaulterState extends State<Dafaulter> {
  @override
  Widget build(BuildContext context) {
    var futureBuilder = new FutureBuilder(
      future: _getData(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return new Text('loading...');
          default:
            if (snapshot.hasError)
              return new Text('Error: ${snapshot.error}');
            else
              return createListView(context, snapshot);
            return new Text('${snapshot.data.length}');
        }
      },
    );

    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fetch Data Example'),
        ),
        body: futureBuilder,
      ),
    );
  }

  Widget createListView(BuildContext context, AsyncSnapshot snapshot) {
    final List<dynamic> values = snapshot.data;
    return new ListView.builder(
      itemCount: values.length,
      itemBuilder: (BuildContext context, int index) {
        return new Column(
          children: <Widget>[
            new ListTile(
              title: new Text(values[index].name),
            ),
            new Divider(
              height: 2.0,
            ),
          ],
        );
      },
    );
  }
}
