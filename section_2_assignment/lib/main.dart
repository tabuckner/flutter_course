// 1) Create a new Flutter App (in this project) and output an AppBar and some text
// below it
// 2) Add a button which changes the text (to any other text of your choice)
// 3) Split the app into three widgets: App, TextControl & Text

import 'package:flutter/material.dart';
import 'package:section_2_assignment/change-text.dart';
import 'package:section_2_assignment/text.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {
  String _displayText = 'Initial App\'s Text';

  void changeText() {
    setState(() {
      this._displayText = 'Changed the text...';
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Section 2 Assignment'),
        ),
        body: Column(
          children: <Widget>[
            OutputText(this._displayText),
            ChangeText(this.changeText)
          ],
        ),
      ),
    );
  }
}
