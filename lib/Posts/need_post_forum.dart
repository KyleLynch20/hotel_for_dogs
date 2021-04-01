import 'package:flutter/material.dart';
import 'package:hotel_for_dogs/database.dart';
import 'package:hotel_for_dogs/HelperWidgets/custom_row.dart';
import 'package:hotel_for_dogs/Forum/forum_page.dart';
import 'package:hotel_for_dogs/HelperWidgets/custom_text_field.dart';

class NeedPostForum extends StatefulWidget {
  // need to get email, uid, state, and city
  final String email;
  final String uid;
  final String state;
  final String city;

  NeedPostForum(this.email,this.uid,this.state,this.city);

  @override
  _NeedPostForumState createState() => _NeedPostForumState();
}

class _NeedPostForumState extends State<NeedPostForum> {
  final dogBreedController = TextEditingController();
  final dogNameController = TextEditingController();
  final amountPerHourController = TextEditingController();
  final amountOfTimeController = TextEditingController();
  final fullNameController = TextEditingController();
  final phoneController = TextEditingController();
  final bioController = TextEditingController();
  final animalFriendlyController = TextEditingController();
  final pottyTrainedController = TextEditingController();
  final titleController = TextEditingController();
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
                CustomRow("Dog Breed", "Dog Name", dogBreedController, dogNameController),
                CustomRow("Animal Friendly", "Potty Trained", animalFriendlyController, pottyTrainedController),
                CustomRow("Amount Per Hour", "Amount of Time", amountPerHourController, amountOfTimeController),
                CustomRow("Phone Number", "Full Name", phoneController, fullNameController),
                Container(
                  padding: const EdgeInsets.all(5.0),
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
                  padding: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 0.0),
                  child:  RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(17.0),
                          side: BorderSide(color: Colors.blueAccent)
                      ),
                      onPressed: () {
                        if(errorCheck(titleController.text,  dogBreedController.text, bioController.text,
                                      amountOfTimeController.text, amountPerHourController.text, animalFriendlyController.text,
                                      pottyTrainedController.text,  dogNameController.text, phoneController.text, fullNameController.text)){
                          Database.makeNeedPost(titleController.text,
                              dogBreedController.text,
                              bioController.text,
                              amountOfTimeController.text,
                              amountPerHourController.text,
                              animalFriendlyController.text,
                              pottyTrainedController.text,
                              widget.state,
                              widget.city,
                              dogNameController.text,
                              widget.email,
                              phoneController.text,
                              fullNameController.text);

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

  bool errorCheck(String title, String dogBreed, String bio, String amountOfTime, String amountPerHour,
                    String animalFriendly, String pottyTrained, String dogName, String phone, String fullName) {
    RegExp doublePatt = new RegExp("\\d+\\.\\d+");
    RegExp intPatt = new RegExp("^[0-9]*[1-9][0-9]*");
    RegExp phonePatt = new RegExp("^(\\d{3}[- .]?){2}\\d{4}");

    if (title.isEmpty || dogBreed.isEmpty || bio.isEmpty || amountOfTime.isEmpty || amountPerHour.isEmpty ||
        animalFriendly.isEmpty || pottyTrained.isEmpty || dogName.isEmpty || phone.isEmpty || fullName.isEmpty){
      setState(() {
        errorMessage = "All fields required";
      });
      return false;
    } else if (animalFriendly.toLowerCase() != "yes" && animalFriendly.toLowerCase() != "no") {
      setState(() {
        errorMessage = "Animal friendly is asking if your dog is friendly with other animals. Please enter yes or no. If no please give specifics in the bio";
      });
      return false;
    } else if (pottyTrained.toLowerCase() != "yes" && pottyTrained.toLowerCase() != "no"){
      setState(() {
        errorMessage = "Potty trained is asking if your dog is potty trained. Please enter yes or no. If no please give specifics in the bio";
      });
      return false;
    } else if (!doublePatt.hasMatch(amountPerHour)) {
      setState(() {
        errorMessage = "Amount Per Hour must be a number with a decimal. Example: 10.50 or 10.0";
      });
      return false;
    } else if (!intPatt.hasMatch(amountOfTime)){
      setState(() {
        errorMessage = "Amount Of Time must be a number. Example: 24 or 48";
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