import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var assetsImage = new AssetImage('images/dog.gif');
    var image = new Image(image: assetsImage, width: 165.0, height: 165.0,);
    return new Container(child: image,);
  }
}