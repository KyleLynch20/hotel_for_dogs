import 'package:flutter/material.dart';


class CustomText extends StatelessWidget {
  final String _label1;
  final String _label2;
  CustomText(this._label1, this._label2);

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
      child: Text(_label1 + _label2, style: TextStyle(fontSize: 16),),
    );
  }
}