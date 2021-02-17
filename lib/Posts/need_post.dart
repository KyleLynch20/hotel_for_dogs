import 'package:flutter/material.dart';
import 'package:hotel_for_dogs/Posts/custom_text.dart';

class NeedPost extends StatelessWidget {
  final String _dogBreed;
  final String _dogNeeds;
  final String _amountPerDay;
  final String _amountPerHour;
  final String _pottyTrained;
  final String _animalFriendly;
  final String _date;
  final String _state;
  final String _city;

  NeedPost(this._dogBreed, this._dogNeeds, this._amountPerDay, this._amountPerHour, this._pottyTrained,
           this._animalFriendly, this._date, this._state, this._city);

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
            // this needs work implement a list view
            Container(
                child: Center(
                  child: Text(
                    "In need of a sitter!",
                    style: TextStyle(fontSize: 20),
                  ),
                )),
            CustomText("Dog Breed", _dogBreed.toString()),
            CustomText("Dog Needs", _dogNeeds.toString()),
            CustomText("Amount Per Day", _amountPerDay.toString()),
            CustomText("Amount Per Hour", _amountPerHour.toString()),
            CustomText("Is the dog potty trained", _pottyTrained.toString()),
            CustomText("Is the dog friendly with other animals", _animalFriendly.toString()),
            CustomText("Date", _date.toString()),
            CustomText("State ", _state.toString()),
            CustomText("City", _city.toString())
          ],
        ));
  }
}
