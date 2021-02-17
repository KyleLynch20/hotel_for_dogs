import 'package:flutter/material.dart';
import 'package:hotel_for_dogs/Posts/need_post.dart';
import 'package:hotel_for_dogs/Posts/need_post_forum.dart';
import 'package:hotel_for_dogs/database.dart';
import 'package:hotel_for_dogs/database.dart';
import 'package:firebase_database/firebase_database.dart';


class ForumPage extends StatefulWidget {
  final String userID;
  final String email;
  ForumPage({Key key,  this.userID, this.email}) : super(key: key);

  @override
  _ForumPageState createState() => _ForumPageState();
}

class _ForumPageState extends State<ForumPage>{
  final stateController = TextEditingController();
  final cityController = TextEditingController();
  bool infoFilled = false;
  Color iAmSitterColor = Colors.grey[150];
  Color needASitterColor = Colors.grey[150];
  var _firebaseRef = FirebaseDatabase().reference().child('posts');

  Future<String> delivery;
  String errorMessage = "";



  @override
  Widget build(BuildContext context) {

    print("this users id: " + widget.userID);

    var row = new Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Expanded(
          child: new Padding(
            padding: const EdgeInsets.all(10.0),
            child:TextField(
              controller: stateController,
              decoration: InputDecoration(
                labelText: "State",
              ),
              cursorColor: Colors.blueAccent,
            ),
          ),
        ),
        Expanded(
          child: new Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: cityController,
              decoration: InputDecoration(
                labelText: "City",
              ),
              cursorColor: Colors.blueAccent,
            ),
          ),
        ),
        Expanded(
          child: new Padding(
            padding: const EdgeInsets.all(10.0),
            child:   Container(
              padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
              child:  RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(17.0),
                      side: BorderSide(color: Colors.blueAccent)
                  ),
                  onPressed: () {
                    // Database.makeNeedPost("german shepard","he is a bad boy he needs to be let out constantly","15","none","no","no","Illinois","chicago");
                    setState(() {
                      if (iAmSitterColor == Colors.black && stateController.text.isNotEmpty && cityController.text.isNotEmpty){
                        infoFilled = true;
                      } else if (needASitterColor == Colors.black && stateController.text.isNotEmpty && cityController.text.isNotEmpty) {
                        infoFilled = true;
                      } else {
                        infoFilled = false;
                      }
                    });
                  },
                  textColor: Colors.blueAccent,
                  padding: const EdgeInsets.all(0.0),
                  child: Text("Go!", style: TextStyle(fontSize: 20), )
              ),
            ),
          ),
        )
      ],
    );


    var row2 = new Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Expanded(
          child: new Padding(
            padding: const EdgeInsets.all(10.0),
            child:   Container(
              padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
              child:  RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(17.0),
                      side: BorderSide(color: Colors.blueAccent)
                  ),
                  onPressed: () {
                    setState(() {
                      iAmSitterColor = Colors.black;
                      needASitterColor = Colors.grey[150];
                    });
                  },
                  textColor: Colors.blueAccent,
                  color: iAmSitterColor,
                  padding: const EdgeInsets.all(0.0),
                  child: Text("I am a sitter", style: TextStyle(fontSize: 20), )
              ),
            ),
          ),
        ),
        Expanded(
          child: new Padding(
            padding: const EdgeInsets.all(1.0),
            child:   Container(
              padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
              child:  RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(17.0),
                      side: BorderSide(color: Colors.blueAccent)
                  ),
                  onPressed: () {
                    setState(() {
                      needASitterColor = Colors.black;
                      iAmSitterColor = Colors.grey[150];
                    });
                  },
                  textColor: Colors.blueAccent,
                  color: needASitterColor,
                  padding: const EdgeInsets.all(0.0),
                  child: Text("Need a sitter", style: TextStyle(fontSize: 20), )
              ),
            ),
          ),
        ),
      ],
    );




    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.grey[100],
          appBar: AppBar(
            title: Text('Dog Hotel'),
          ),
          body: Container(
              padding: const EdgeInsets.all(10.0),
              child: Column(
            children: [
              row2,
              row,
              StreamBuilder(
                stream: _firebaseRef.onValue,
                builder: (context, snap) {

                  if (snap.hasData && !snap.hasError && snap.data.snapshot.value != null && infoFilled) {
                    Map data = snap.data.snapshot.value;
                    List item = [];
                    data.forEach((index, data) => item.add({"key": index, ...data}));
                    print("data length: " + data.length.toString());
                    return SizedBox(
                        height: 400,
                        child: ListView.builder(
                      itemCount: item.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return Card( child: NeedPost(
                            item[index]['dogBreed'],
                            item[index]['dogNeeds'],
                            item[index]['amountPerDay'],
                            item[index]['amountPerHour'],
                            item[index]['pottyTrained'],
                            item[index]['animalFriendly'],
                            item[index]['date'],
                            item[index]['state'],
                            item[index]['city'] )
                        );
                      },
                    )
                    );
                  }
                  else
                    return Text("No data");
                },
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10.0, 6.0, 10.0, 0.0),
                child:  RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(17.0),
                        side: BorderSide(color: Colors.blueAccent)
                    ),
                    onPressed: () {
                      if (iAmSitterColor == Colors.black && stateController.text.isNotEmpty && cityController.text.isNotEmpty){

                      } else if (needASitterColor == Colors.black && stateController.text.isNotEmpty && cityController.text.isNotEmpty) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NeedPostForum(widget.email,widget.userID,stateController.text,cityController.text),
                            ));
                      }
                    },
                    textColor: Colors.blueAccent,
                    padding: const EdgeInsets.all(0.0),
                    child: Text("post!", style: TextStyle(fontSize: 20), )
                ),
              ),



            ],
          )
          )
      ),
    );
  }
}

