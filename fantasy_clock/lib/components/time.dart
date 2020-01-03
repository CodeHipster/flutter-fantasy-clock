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
      // 20% space above
      Flexible(flex: 2, child: Container()),
      // 60% space for the digits
      Flexible(
        flex: 6,
        child: Row( // 11 flex width
          children: [
            Flexible(child: Container(),), // 1 flex left
            Flexible(flex: 2, child: Digit()),
            Flexible(flex: 2, child: Digit()),
            Flexible(child: Image.asset("assets/images/colon.png",fit:BoxFit.contain, height: double.infinity)),
            Flexible(flex: 2, child: Digit()),
            Flexible(flex: 2, child: Digit()),
            Flexible(child: Container()), // 1 flex right
          ],
        ),
      ),
      // 20% space on the bottom
      Flexible(flex: 2, child: Container()),
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
    return Image.asset("assets/images/1.png",fit:BoxFit.contain, height: double.infinity,);
  }
}

/**
 * digit positioning
 * we want it configurable
 * configurable size
 * configurable position
 *
 **/
