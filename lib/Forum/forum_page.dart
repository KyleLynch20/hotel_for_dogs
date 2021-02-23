import 'package:flutter/material.dart';
import 'package:hotel_for_dogs/Forum/stream_builder.dart';
import 'package:hotel_for_dogs/Posts/need_post_forum.dart';
import 'package:hotel_for_dogs/Posts/sitter_post_forum.dart';



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
  Color iAmSitterColor = Colors.grey[150];
  Color needASitterColor = Colors.grey[150];
  // this has to be a non empty string or else it will throw an error
  String typeOfPost = "not an empty string!";
  String state = "";
  String city = "";

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
                    setState(() {
                      if (iAmSitterColor == Colors.black && stateController.text.isNotEmpty && cityController.text.isNotEmpty){
                        typeOfPost = "needPosts";
                        state = stateController.text;
                        city = cityController.text;
                      } else if (needASitterColor == Colors.black && stateController.text.isNotEmpty && cityController.text.isNotEmpty) {
                        typeOfPost = "sitterPosts";
                        state = stateController.text;
                        city = cityController.text;
                      }
                    });
                  },
                  textColor: Colors.blueAccent,
                  padding: const EdgeInsets.all(0.0),
                  child: Text("Search", style: TextStyle(fontSize: 20), )
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
          body: SingleChildScrollView(
          child: Container(
              padding: const EdgeInsets.all(10.0),
              child: Column(
            children: [
              row2,
              row,
              MyStreamBuilder(typeOfPost, state, city),
              Container(
                padding: const EdgeInsets.fromLTRB(10.0, 6.0, 10.0, 0.0),
                child:  RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(17.0),
                        side: BorderSide(color: Colors.blueAccent)
                    ),
                    onPressed: () {
                      if (iAmSitterColor == Colors.black && stateController.text.isNotEmpty && cityController.text.isNotEmpty){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SitterPostForum(widget.email,widget.userID,stateController.text,cityController.text),
                            ));
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
                    child: Text("Post", style: TextStyle(fontSize: 20), )
                ),
              ),
            ],
          )
          )
      ),
      )
    );
  }
}

