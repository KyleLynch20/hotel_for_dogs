import 'package:flutter/material.dart';
import 'package:hotel_for_dogs/HelperWidgets/custom_text_field.dart';
import 'package:hotel_for_dogs/database.dart';
import 'package:hotel_for_dogs/user.dart';
import 'package:hotel_for_dogs/LoginAndRegister/image_container.dart';
import 'package:hotel_for_dogs/Forum/forum_page.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  Future<Users> delivery;
  String errorMessage = "";

  void _login() async {
    delivery = Database.login(emailController.text, passwordController.text);
    await delivery.then((Users user) => setState(() {
      if (user.email == null && user.uid == null) {
        errorMessage = user.errorMessage;
      } else {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ForumPage(userID: user.uid, email: user.email,),
            ));
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
          body: SingleChildScrollView(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ImageContainer(),
                CustomTextField("Email", emailController),
                CustomTextField("Password", passwordController),
                Container(
                  padding: const EdgeInsets.fromLTRB(10.0, 6.0, 10.0, 0.0),
                  child:  RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(17.0),
                          side: BorderSide(color: Colors.blueAccent)
                      ),
                      onPressed: () {
                        _login();
                      },
                      textColor: Colors.blueAccent,
                      padding: const EdgeInsets.all(0.0),
                      child: Text("Login", style: TextStyle(fontSize: 20), )
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10.0, 6.0, 10.0, 0.0),
                  child:  RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(17.0),
                          side: BorderSide(color: Colors.blueAccent)
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, "/register");
                      },
                      textColor: Colors.blueAccent,
                      padding: const EdgeInsets.all(0.0),
                      child: Text("Register", style: TextStyle(fontSize: 20), )
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10.0, 6.0, 10.0, 0.0),
                  child: Center(
                      child: Text(errorMessage, style: TextStyle(fontSize: 20, color: Colors.red))
                  ),
                )
            ],
              )
          )
      ),
    );
  }
}