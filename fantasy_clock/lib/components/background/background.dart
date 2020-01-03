import 'package:flutter/material.dart';

class Background extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(child: Image.asset("assets/images/background.jpg", fit: BoxFit.cover,));
  }
}