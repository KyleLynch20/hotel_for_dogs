import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String _label;
  final TextEditingController _controller;
  final bool _passwordText;

  CustomTextField(this._label,this._controller, this._passwordText);

  @override
  Widget build(BuildContext context) {
    return Container(
          padding: const EdgeInsets.all(5.0),
          child: TextField(
            obscureText: _passwordText == true ? true : false,
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