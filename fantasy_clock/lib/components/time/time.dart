import 'dart:async';

import 'package:fantasy_clock/components/time/time-stream.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

import 'digit.dart';


/// The Time widget is the part of the clock that shows and manages the time display.
/// It is build up out of 4 digit widgets and a colon widget.
/// Each digit is a full screen image with transparency.
/// This is because the digit has a position on the background and thus can't be flexibly placed.
class Time extends StatelessWidget {

  List<Digit> digits = new List(4);

  Time(){
    var timeStream = new TimeStream();

    digits[0] = Digit(1, timeStream);
    digits[1] = Digit(2, timeStream);
    digits[2] = Digit(3, timeStream);
    digits[3] = Digit(4, timeStream);
  }

  @override
  Widget build(BuildContext context) {
    var stack = Stack(children: [
      digits[0],
      digits[1],
      Image.asset("assets/images/colon.png"),
      digits[2],
      digits[3],
    ]);
    return stack;
  }
}
