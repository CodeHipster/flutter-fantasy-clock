import 'dart:async';

import 'package:flutter/widgets.dart';

import 'digit.dart';


/// The Time widget is the part of the clock that shows and manages the time display.
/// It is build up out of 4 digit widgets and a colon widget.
/// Each digit is a full screen image with transparency.
/// This is because the digit has a position on the background and thus can't be flexibly placed.

class Time extends StatefulWidget {

  @override
  State<Time> createState() => TimeState();

}

class TimeState extends State<Time> {
  DateTime _time = DateTime.now();
  Timer _timer;

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //height proportion
    return Stack(children: [
      Digit(1),
      Digit(2),
      Image.asset("assets/images/colon.png"),
      Digit(3),
      Digit(4),
    ]);
  }

  void _updateTime(){
    DateTime tempTime = DateTime.now();
    _timer = Timer(
      Duration(minutes: 1) -
          Duration(seconds: _time.second) -
          Duration(milliseconds: _time.millisecond),
      _updateTime,
    );
    setState(() {
      _time = tempTime;
    });
  }

  @override
  void didUpdateWidget(Time oldWidget) {
    super.didUpdateWidget(oldWidget);
    // rewire listeners
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
