import 'package:flutter/material.dart';
import 'package:hotel_for_dogs/LoginAndRegister/custom_text_field.dart';
import 'package:hotel_for_dogs/LoginAndRegister/custom_button.dart';
import 'package:hotel_for_dogs/image_container.dart';

class Login extends StatefulWidget {

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.grey[100],
          appBar: AppBar(
            title: Text('Dog Hotel'),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ImageContainer(),
              CustomTextField("Email", emailController),
              CustomTextField("Password", passwordController),
              CustomButton("Login",context,"/main",emailController, passwordController, "login"),
              CustomButton("Register", context,"/register",emailController, passwordController, "pass")
            ],
          )
      ),
    );
  }
}