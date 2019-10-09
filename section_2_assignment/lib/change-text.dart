import 'package:flutter/material.dart';

class ChangeText extends StatelessWidget {
  final Function _onChangeText;

  ChangeText(this._onChangeText);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text('Change'),
      color: Colors.blue,
      onPressed: () => this._onChangeText(),
    );
  }
}
