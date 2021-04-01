import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hotel_for_dogs/Posts/need_post.dart';
import 'package:hotel_for_dogs/Posts/sitter_post.dart';

class MyStreamBuilder extends StatelessWidget {
  final String _typeOfPost;
  final String _state;
  final String _city;
  final bool _allFieldsFull;
  final bool _validStateAndCity;
  MyStreamBuilder(this._typeOfPost, this._state, this._city, this._allFieldsFull, this._validStateAndCity);

  @override
  Widget build(BuildContext context) {
    Stream stream = FirebaseFirestore.instance.collection(_typeOfPost).where('state', isEqualTo: _state).where('city', isEqualTo: _city).snapshots();
    return SizedBox(
        height: 400,
        child: StreamBuilder<QuerySnapshot>(
          // needPosts
        stream: stream,
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data.size > 0) {
            final List<DocumentSnapshot> documents = snapshot.data.docs;
            if (_typeOfPost == "needPosts") {
              return ListView(
                  children: documents
                      .map((doc) => Card( child: NeedPost(
                      doc.data()['title'],
                      doc.data()['dogBreed'],
                      doc.data()['dogNeeds'],
                      doc.data()['amountOfTime'],
                      doc.data()['amountPerHour'],
                      doc.data()['pottyTrained'],
                      doc.data()['animalFriendly'],
                      doc.data()['date'],
                      doc.data()['state'],
                      doc.data()['city'],
                      doc.data()['dogName'],
                      doc.data()['email'],
                      doc.data()['phone'],
                      doc.data()['fullName'])
                  ))
                      .toList());
            } else {
              return ListView(
                  children: documents
                      .map((doc) => Card( child: SitterPost(
                      doc.data()['title'],
                      doc.data()['amountPerHour'],
                      doc.data()['date'],
                      doc.data()['state'],
                      doc.data()['city'],
                      doc.data()['email'],
                      doc.data()['phone'],
                      doc.data()['fullName'],
                      doc.data()['breedSize'],
                      doc.data()['bio'],
                      doc.data()['fencedBackYard'],
                      doc.data()['otherAnimals'])
                  ))
                      .toList());
            }
          } else if (snapshot.hasError) {
            return Text("error");
          } else if(!snapshot.hasData){
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (!_allFieldsFull) {
              return Text("No Data");
              //return Text("Please enter in a valid city and state and click on either I am a sitter or Need a sitter.");
            } else if(!_validStateAndCity) {
              return Text("No Data");
              //return Text("Please enter in a valid city and state");
            } else {
              return Text("No Data");
            }
          }
            }));
  }
}