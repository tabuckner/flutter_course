import 'package:flutter/material.dart';

class OutputText extends StatelessWidget {
  final String _text;

  OutputText(this._text);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(this._text),
    );
  }
}
