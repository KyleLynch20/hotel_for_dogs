import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String _label;
  final TextEditingController _controller;

  CustomTextField(this._label,this._controller);

  @override
  Widget build(BuildContext context) {
    return Container(
          padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
          child: TextField(
            controller: _controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: _label,
            ),
            cursorColor: Colors.blueAccent,
          ),
    );
  }
}