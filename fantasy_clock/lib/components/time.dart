import 'package:flutter/material.dart';

class Time extends StatefulWidget {
  @override
  State<Time> createState() => TimeState();
}

class TimeState extends State<Time> {
  @override
  Widget build(BuildContext context) {
    //height proportion

    return Column(children: [
      Expanded(flex: 2, child: Container(color: Colors.red,)),
      Expanded(
        flex: 6,
        child: Center(
          child: Row(
            children: [
              Digit(),
              Digit(),
              Flexible(child: Image.asset("assets/images/colon.png",fit:BoxFit.contain, height: double.infinity)),
              Digit(),
              Digit()
            ],
            mainAxisSize: MainAxisSize.min,
          ),
        ),
      ),
      Expanded(flex: 2, child: Container(color: Colors.red,)),
    ]);
  }
}

class Digit extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => DigitState();
}

class DigitState extends State<Digit> {
  @override
  Widget build(BuildContext context) {
    return Flexible(child: Image.asset("assets/images/1.png",fit:BoxFit.contain, height: double.infinity,));
  }
}

/**
 * digit positioning
 * we want it configurable
 * configurable size
 * configurable position
 *
 **/
