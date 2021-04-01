import 'package:flutter/material.dart';
import 'package:hotel_for_dogs/database.dart';
import 'package:hotel_for_dogs/HelperWidgets/custom_row.dart';
import 'package:hotel_for_dogs/Forum/forum_page.dart';
import 'package:hotel_for_dogs/HelperWidgets/custom_text_field.dart';

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
  String errorMessage = "";

  @override
  Widget build(BuildContext context) {
    print(" email: " + widget.email + " uid: " + widget.uid + " state: " + widget.state + " city: " + widget.city);
    return Scaffold(
          backgroundColor: Colors.grey[100],
          appBar: AppBar(
            title: Text('Dog Hotel'),
          ),
          body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomTextField("Title for post", titleController, false),
                  CustomRow("Breed size willing to watch", "Fenced in back yard?", breedSizeController, fencedBackYardController),
                  CustomRow("Do you have other animals?", "Amount Per Hour", otherAnimalsController, amountPerHourController),
                  CustomRow("Phone Number", "Full Name", phoneController, fullNameController),
                  Container(
                    padding: const EdgeInsets.all(5.0),
                    child: TextField(
                      controller: bioController,
                      maxLines: 5,
                      decoration: InputDecoration(
                        hintText: "Sitter Bio",
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

                          if(errorCheck(titleController.text,  breedSizeController.text,  bioController.text, amountPerHourController.text,
                              otherAnimalsController.text, phoneController.text,  fullNameController.text, fencedBackYardController.text)){
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
                                  builder: (context) => ForumPage(userID: widget.uid, email: widget.email,),
                                ));
                          }
                        },
                        textColor: Colors.blueAccent,
                        padding: const EdgeInsets.all(0.0),
                        child: Text("Post!", style: TextStyle(fontSize: 20), )
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
      );
  }

  bool errorCheck(String title, String dogBreed, String bio, String amountPerHour,
      String otherAnimals, String phone, String fullName, fencedBackYard) {
    RegExp doublePatt = new RegExp("\\d+\\.\\d+");
    RegExp phonePatt = new RegExp("^(\\d{3}[- .]?){2}\\d{4}");

    if (title.isEmpty || dogBreed.isEmpty || bio.isEmpty || amountPerHour.isEmpty ||
        otherAnimals.isEmpty || phone.isEmpty || fullName.isEmpty  || fencedBackYard.isEmpty){
      setState(() {
        errorMessage = "All fields required";
      });
      return false;
    } else if (otherAnimals.toLowerCase() != "yes" && otherAnimals.toLowerCase() != "no") {
      setState(() {
        errorMessage = "Other animals is asking if you have other animals in your house. Please enter yes or no. If no please give specifics in the bio";
      });
      return false;
    } else if (fencedBackYard.toLowerCase() != "yes" && fencedBackYard.toLowerCase() != "no"){
      setState(() {
        errorMessage = "Fenced in back yard is asking if you have a fenced in back yard or not. Please enter yes or no. If no please give specifics in the bio";
      });
      return false;
    } else if (dogBreed.toLowerCase() != "any" && dogBreed.toLowerCase() != "small" &&
        dogBreed.toLowerCase() != "medium" && dogBreed.toLowerCase() != "large"){
      setState(() {
        errorMessage = "Must enter any, small, medium, or large for breed size willing to watch";
      });
      return false;
    } else if (!doublePatt.hasMatch(amountPerHour)) {
      setState(() {
        errorMessage = "Amount Per Hour must be a number with a decimal. Example: 10.50 or 10.0";
      });
      return false;
    } else if (!phonePatt.hasMatch(phone)){
      setState(() {
        errorMessage = "Please enter a valid phone number. Example: 123-456-7890";
      });
      return false;
    } else {
      return true;
    }
  }
}