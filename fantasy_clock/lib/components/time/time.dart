import 'package:fantasy_clock/components/time/time-stream.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_clock_helper/model.dart';

import 'digit.dart';

/// The Time widget is the part of the clock that shows and manages the time display.
/// It is build up out of 4 digit widgets and a colon widget.
/// Each digit is a full screen image with transparency.
/// This is because the digit has a position on the background and thus can't be flexibly placed.
class Time extends StatefulWidget {

  final ClockModel _clockSettings;

  Time(this._clockSettings);

  @override
  State<StatefulWidget> createState() => _TimeState();

}

class _TimeState extends State<Time>{

  final MinuteNotifier _timeStream = MinuteNotifier();
  final List<Digit> digits = new List(4);

  @override
  void initState(){
    super.initState();
    digits[0] = Digit(1, _timeStream, widget._clockSettings);
    digits[1] = Digit(2, _timeStream, widget._clockSettings);
    digits[2] = Digit(3, _timeStream, widget._clockSettings);
    digits[3] = Digit(4, _timeStream, widget._clockSettings);
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

  @override
  void dispose(){
    super.dispose();
    _timeStream.dispose();
  }

}