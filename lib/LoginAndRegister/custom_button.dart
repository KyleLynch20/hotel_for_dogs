import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hotel_for_dogs/database.dart';

class CustomButton extends StatelessWidget {
  final String _label;
  final String _path;
  final BuildContext _ctx;
  final FirebaseAuth auth = FirebaseAuth.instance;
  final TextEditingController _emailController;
  final TextEditingController _passwordController;
  final String _mode;


  CustomButton(this._label, this._ctx,this._path, this._emailController, this._passwordController, this._mode);
  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.fromLTRB(10.0, 6.0, 10.0, 0.0),
      child:  RaisedButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(17.0),
              side: BorderSide(color: Colors.blueAccent)
          ),
          onPressed: () {
            print("email : " + _emailController.text + " password: " + _passwordController.text);
            print("mode: " + _mode);
            if (_mode == "pass") {
              // simply navigate to the register page
              Navigator.pushNamed(_ctx, _path);
            } else if (_mode == "login") {
              // implement login
            } else if (_mode == "register") {
              // fix this method to return true or false
              //Database.signUp(_emailController.text, _passwordController.text);
              // if true then return to login else display error message
              Navigator.pushNamed(_ctx, _path);
            }
          },
          textColor: Colors.blueAccent,
          padding: const EdgeInsets.all(0.0),
          child: Text(_label, style: TextStyle(fontSize: 20), )
      ),
    );
  }
}