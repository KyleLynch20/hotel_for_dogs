import 'package:flutter/material.dart';
import 'package:hotel_for_dogs/LoginAndRegister/custom_text_field.dart';
import 'package:hotel_for_dogs/database.dart';


class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register>{
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  Future<String> delivery;
  String errorMessage = "";

  void emailSignUp() async {
    delivery = Database.signUp(emailController.text, passwordController.text, confirmPasswordController.text);
    await delivery.then((String result) => setState(() {
      if (result == "success") {
        Navigator.pushNamed(context, "/");
      } else {
        errorMessage = result;
      }
    }));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.grey[100],
          appBar: AppBar(
            title: Text('Dog Hotel'),
          ),
          body: Column(
            children: [
              CustomTextField("Email", emailController),
              CustomTextField("Password", passwordController),
              CustomTextField("Confirm Password", confirmPasswordController),
              Container(
                padding: const EdgeInsets.fromLTRB(10.0, 6.0, 10.0, 0.0),
                child:  RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(17.0),
                        side: BorderSide(color: Colors.blueAccent)
                    ),
                    onPressed: () {
                      setState(() {
                        emailSignUp();
                      });
                    },
                    textColor: Colors.blueAccent,
                    padding: const EdgeInsets.all(0.0),
                    child: Text("Register", style: TextStyle(fontSize: 20), )
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10.0, 6.0, 10.0, 0.0),
                child: Text(errorMessage),
              )

            ],
          )
      ),
    );
  }
}

