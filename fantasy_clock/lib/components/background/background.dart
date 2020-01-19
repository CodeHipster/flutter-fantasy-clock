import 'package:flutter/material.dart';

class Background extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => _BackgroundState();
}

class _BackgroundState extends State<Background>{

  @override
  Widget build(BuildContext context) {

    final String theme = Theme.of(context).brightness == Brightness.light
        ?"light":"dark";

    print("rebuilding background: $theme");

    return SizedBox.expand(child: Image.asset("assets/images/$theme/background/background.jpg", fit: BoxFit.cover,));
  }

}