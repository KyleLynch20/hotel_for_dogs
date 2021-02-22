import 'package:firebase_auth/firebase_auth.dart';
import 'package:hotel_for_dogs/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';



class Database {
  static Future<String> signUp(String email, String password, String confirmPassword) async {
    if (password != confirmPassword) {
      return "passwords do not match";
    }
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return "The password provided is too weak";
      } else if (e.code == 'email-already-in-use') {
        return "The account already exists for that email";
      } else if (e.code == 'unknown') {
        return "All fields required!";
      } else {
        print(e);
        return e.toString();
      }
    } catch (e) {
      print(e);
      return e.toString();
    }
    return "success";
  }

  static Future<Users> login(String email, String password) async {
    UserCredential userCredential;
    try {
      userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return new Users(null, null, "No user found for that email");
      } else if (e.code == 'wrong-password') {
        return new Users(null, null, "Wrong password provided for that user");
      } else if (e.code == 'unknown') {
        return new Users(null, null, "All fields required!");
      }
    }
    return new Users(email, userCredential.user.uid.toString(), null);
  }

  // need to add user id, full name, phone, email
  static void makeNeedPost( String title, String dogBreed, String dogNeeds,
                            String amountOfTime, String amountPerHour,
                            String pottyTrained, String animalFriendly,
                            String state, String city, String dogName,
                            String email, String phone, String fullName) {

    var now = new DateTime.now();
    var formatter = new DateFormat('MM-dd-yyyy');
    String formattedDate = formatter.format(now);

    CollectionReference _firebaseRef = FirebaseFirestore.instance.collection('needPosts');
    _firebaseRef.add({
      "title": title,
      "dogBreed": dogBreed,
      "dogNeeds": dogNeeds,
      "amountOfTime": amountOfTime,
      "amountPerHour": amountPerHour,
      "pottyTrained": pottyTrained,
      "animalFriendly": animalFriendly,
      "date": formattedDate,
      "state": state,
      "city": city,
      "dogName": dogName,
      "email": email,
      "phone": phone,
      "fullName": fullName
    })
        .then((value) => print("success (need post)"))
        .catchError((error) => print("fail (need post): $error"));



  }
}