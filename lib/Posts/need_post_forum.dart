import 'package:flutter/material.dart';
import 'package:hotel_for_dogs/LoginAndRegister/custom_text_field.dart';
import 'package:hotel_for_dogs/database.dart';
import 'custom_row.dart';

class NeedPostForum extends StatefulWidget {
  // need to get email, uid, state, and city
  @override
  _NeedPostForumState createState() => _NeedPostForumState();
}

class _NeedPostForumState extends State<NeedPostForum> {
  final dogBreedController = TextEditingController();
  final dogNeedsController = TextEditingController();
  final stateController = TextEditingController();
  final cityController = TextEditingController();
  final amountPerHourController = TextEditingController();
  final amountPerDayController = TextEditingController();
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
          body: SingleChildScrollView(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomRow("Dog Breed","Dog Name",dogBreedController, dogNeedsController),
                CustomRow("Animal Friendly","Potty Trained",dogBreedController, dogNeedsController),
                CustomRow("Amount Per Hour","Amount Per Day",amountPerHourController, amountPerDayController),
                CustomRow("Phone Number","Email",amountPerHourController, amountPerDayController),
                Container(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: "Dog bio / needs",
                    border: OutlineInputBorder(),
                  ),
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
                      child: Text("Post!", style: TextStyle(fontSize: 20), )
                  ),
                ),
              ],
          )
          )
      ),
    );
  }
}