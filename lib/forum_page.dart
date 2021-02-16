import 'package:flutter/material.dart';
import 'package:hotel_for_dogs/LoginAndRegister/custom_text_field.dart';
import 'package:hotel_for_dogs/database.dart';


class ForumPage extends StatefulWidget {
  final String userID;
  ForumPage({Key key,  this.userID}) : super(key: key);

  @override
  _ForumPageState createState() => _ForumPageState();
}

class _ForumPageState extends State<ForumPage>{
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  Future<String> delivery;
  String errorMessage = "";



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
              Container(
                padding: const EdgeInsets.fromLTRB(10.0, 6.0, 10.0, 0.0),
                child: Center(
                    child: Text(widget.userID, style: TextStyle(fontSize: 20, color: Colors.red),)
                ),
              )

            ],
          )
      ),
    );
  }
}

