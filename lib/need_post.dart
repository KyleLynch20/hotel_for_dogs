import 'package:flutter/material.dart';
import 'package:hotel_for_dogs/LoginAndRegister/custom_text_field.dart';
import 'package:hotel_for_dogs/LoginAndRegister/custom_button.dart';
import 'package:hotel_for_dogs/image_container.dart';

class NeedPost extends StatelessWidget {

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
              // this needs work implement a list view
              CustomTextField("Dog Breed", emailController),
              CustomTextField("Dog Needs", passwordController),
              CustomTextField("Emergency Contact Phone Number", emailController),
              CustomTextField("Amount per Hour", passwordController),
              CustomTextField("Amount Per Day", emailController),
              CustomTextField("Is the dog potty trained", passwordController),
              CustomTextField("Is the dog animal friendly", emailController),
            ],
          )
      ),
    );
  }
}