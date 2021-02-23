import 'package:flutter/material.dart';
import 'package:hotel_for_dogs/Posts/custom_text.dart';

class SitterPost extends StatelessWidget {
  final String _title;
  final String _amountPerHour;
  final String _date;
  final String _state;
  final String _city;
  final String _email;
  final String _phone;
  final String _fullName;
  final String _breedSizeWillingToWatch;
  final String _bio;
  final String _fencedBackYard;
  final String _otherAnimals;



  SitterPost(this._title, this._amountPerHour, this._date, this._state, this._city, this._email,
             this._phone, this._fullName, this._breedSizeWillingToWatch, this._bio, this._fencedBackYard, this._otherAnimals);

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
            CustomText("Amount Per Hour", _amountPerHour.toString()),
            CustomText("Breed Size Willing To Watch", _breedSizeWillingToWatch.toString()),
            CustomText("Bio", _bio.toString()),
            CustomText("fenced In Back Yard", _fencedBackYard.toString()),
            CustomText("Other Animals", _otherAnimals),
            CustomText("Email", _email.toString()),
            CustomText("Phone", _phone.toString()),
            CustomText("Name", _fullName.toString()),
            CustomText("Date Posted", _date.toString()),
            CustomText("State", _state.toString()),
            CustomText("City", _city.toString())
          ],
        ));
  }
}
