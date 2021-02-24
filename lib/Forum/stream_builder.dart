import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hotel_for_dogs/Posts/need_post.dart';
import 'package:hotel_for_dogs/Posts/sitter_post.dart';

class MyStreamBuilder extends StatelessWidget {
  final String _typeOfPost;
  final String _state;
  final String _city;
  MyStreamBuilder(this._typeOfPost, this._state, this._city);

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
            if(_typeOfPost == "needPosts") {
              return ListView(
                  children: documents
                      .map((doc) => Card( child: NeedPost(
                      doc['title'],
                      doc['dogBreed'],
                      doc['dogNeeds'],
                      doc['amountOfTime'],
                      doc['amountPerHour'],
                      doc['pottyTrained'],
                      doc['animalFriendly'],
                      doc['date'],
                      doc['state'],
                      doc['city'],
                      doc['dogName'],
                      doc['email'],
                      doc['phone'],
                      doc['fullName'])
                  ))
                      .toList());
            } else {
              return ListView(
                  children: documents
                      .map((doc) => Card( child: SitterPost(
                      doc['title'],
                      doc['amountPerHour'],
                      doc['date'],
                      doc['state'],
                      doc['city'],
                      doc['email'],
                      doc['phone'],
                      doc['fullName'],
                      doc['breedSize'],
                      doc['bio'],
                      doc['fencedBackYard'],
                      doc['otherAnimals'])
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
            return Text("No Data");
          }
            }));
  }
}