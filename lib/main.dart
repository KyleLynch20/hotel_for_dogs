import 'package:flutter/material.dart';
import 'package:hotel_for_dogs/LoginAndRegister/register.dart';
import 'package:hotel_for_dogs/LoginAndRegister/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hotel_for_dogs/need_post.dart';

void main() async  {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    title: 'Dog Hotel',
    // Start the app with the "/" named route. In this case, the app starts
    // on the FirstScreen widget.
    initialRoute: '/',
    routes: {
      // When navigating to the "/" route, build the FirstScreen widget.
      '/': (context) => Login(),
      // When navigating to the "/second" route, build the SecondScreen widget.
      '/register': (context) => Register(),
    },
  ));
}




