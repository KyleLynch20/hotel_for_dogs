import 'package:flutter/material.dart';


class CustomRow extends StatelessWidget {
  final String _label1;
  final String _label2;
  final TextEditingController _controller1;
  final TextEditingController _controller2;

  CustomRow(this._label1, this._label2, this._controller1, this._controller2);
  @override
  Widget build(BuildContext context) {
    var row = new Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Expanded(
          child: new Padding(
            padding: const EdgeInsets.all(5.0),
            child:TextField(
              controller: _controller1,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: _label1,
              ),
              cursorColor: Colors.blueAccent,
            ),
          ),
        ),
        Expanded(
          child: new Padding(
            padding: const EdgeInsets.all(5.0),
            child: TextField(
              controller: _controller2,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: _label2,
              ),
              cursorColor: Colors.blueAccent,
            ),
          ),
        ),
      ],
    );
    return row;
  }
}