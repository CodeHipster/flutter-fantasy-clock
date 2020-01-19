import 'package:flutter/material.dart';

class Foreground extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => _ForegroundState();
}

class _ForegroundState extends State<Foreground>{

  @override
  Widget build(BuildContext context) {

    final String theme = Theme.of(context).brightness == Brightness.light
        ?"light":"dark";

    print("rebuilding foreground: $theme");

    return SizedBox.expand(child: Image.asset("assets/images/$theme/foreground/foreground.png", fit: BoxFit.cover,));
  }

}