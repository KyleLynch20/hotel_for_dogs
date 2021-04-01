import 'package:flutter/material.dart';
import 'package:hotel_for_dogs/HelperWidgets/custom_text.dart';

class NeedPost extends StatelessWidget {
  final String _title;
  final String _dogBreed;
  final String _dogNeeds;
  final String _awayTime;
  final String _amountPerHour;
  final String _pottyTrained;
  final String _animalFriendly;
  final String _date;
  final String _state;
  final String _city;
  final String _dogName;
  final String _email;
  final String _phone;
  final String _fullName;


  NeedPost(this._title, this._dogBreed, this._dogNeeds, this._awayTime, this._amountPerHour, this._pottyTrained,
           this._animalFriendly, this._date, this._state, this._city, this._dogName, this._email, this._phone, this._fullName);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration:
        BoxDecoration(border: Border.all(color: Colors.blueAccent)),
        padding: const EdgeInsets.fromLTRB(10.0, 6.0, 10.0, 6.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
                child: Center(
                  child: Text(
                    _title,
                    style: TextStyle(fontSize: 20),
                  ),
                )),
            CustomText("Dog Breed: ", _dogBreed.toString()),
            CustomText("Dog Name: ", _dogName.toString()),
            CustomText("Dog Needs \\ Bio: ", _dogNeeds.toString()),
            CustomText("Away time: ", _awayTime.toString()),
            CustomText("Amount Per Hour: \$", _amountPerHour.toString()),
            CustomText("Is the dog potty trained: ", _pottyTrained.toString()),
            CustomText("Is the dog friendly with other animals: ", _animalFriendly.toString()),
            CustomText("Email: ", _email.toString()),
            CustomText("Phone: ", _phone.toString()),
            CustomText("Name: ", _fullName.toString()),
            CustomText("Date Posted: ", _date.toString()),
            CustomText("State: ", _state.toString()),
            CustomText("City: ", _city.toString())
          ],
        ));
  }
}
