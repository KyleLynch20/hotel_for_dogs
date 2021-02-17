import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';


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
        print('The password provided is too weak.');
        return "The password provided is too weak";
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        return "The account already exists for that email";
      } else if (e.code == 'unknown') {
        print('All fields required!');
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

  static Future<String> login(String email, String password) async {
    UserCredential userCredential;
    try {
      userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        return "No user found for that email";
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user');
        return "Wrong password provided for that user";
      } else if (e.code == 'unknown') {
        print('All fields required!');
        return "All fields required!";
      }
    }

    return userCredential.user.uid;
  }

  static void makeNeedPost(String dogBreed, String dogNeeds, String amountPerDay, String amountPerHour, String pottyTrained, String animalFriendly, String state, String city){
    var _firebaseRef = FirebaseDatabase().reference().child('posts');
    _firebaseRef.push().set({
      "dogBreed": dogBreed,
      "dogNeeds": dogNeeds,
      "amountPerDay": amountPerDay,
      "amountPerHour": amountPerHour,
      "pottyTrained": pottyTrained,
      "animalFriendly": animalFriendly,
      "date": "test",
      "state": state,
      "city": city,
    });

  }
}