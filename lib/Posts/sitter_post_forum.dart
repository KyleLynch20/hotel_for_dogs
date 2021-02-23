import 'package:flutter/material.dart';
import 'package:hotel_for_dogs/database.dart';
import 'custom_row.dart';
import 'package:hotel_for_dogs/Forum/forum_page.dart';
import 'package:hotel_for_dogs/LoginAndRegister/custom_text_field.dart';

class SitterPostForum extends StatefulWidget {
  // need to get email, uid, state, and city
  final String email;
  final String uid;
  final String state;
  final String city;

  SitterPostForum(this.email,this.uid,this.state,this.city);

  @override
  _SitterPostForumState createState() => _SitterPostForumState();
}

class _SitterPostForumState extends State<SitterPostForum> {
  final amountPerHourController = TextEditingController();
  final fullNameController = TextEditingController();
  final phoneController = TextEditingController();
  final bioController = TextEditingController();
  final titleController = TextEditingController();
  final breedSizeController = TextEditingController();
  final fencedBackYardController = TextEditingController();
  final otherAnimalsController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    print(" email: " + widget.email + " uid: " + widget.uid + " state: " + widget.state + " city: " + widget.city);
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
                  CustomTextField("Title for post", titleController),
                  CustomRow("Breed size willing to watch", "Fenced in back yard?", breedSizeController, fencedBackYardController),
                  CustomRow("Do you have other animals?", "Amount Per Hour", otherAnimalsController, amountPerHourController),
                  CustomRow("Phone Number", "Full Name", phoneController, fullNameController),
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    child: TextField(
                      controller: bioController,
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
                          // missing dog name, email, and phone, full name
                          Database.makeSitterPost(titleController.text,
                              breedSizeController.text,
                              bioController.text,
                              amountPerHourController.text,
                              widget.state,
                              widget.city,
                              otherAnimalsController.text,
                              widget.email,
                              phoneController.text,
                              fullNameController.text,
                              fencedBackYardController.text);

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ForumPage(userID: widget.email, email: widget.uid,),
                              ));
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