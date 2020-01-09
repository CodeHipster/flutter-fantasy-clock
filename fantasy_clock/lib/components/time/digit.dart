import 'dart:math';

import 'package:flutter/widgets.dart';

import 'time-stream.dart';

class Digit extends StatefulWidget {
  final int _position;
  TimeStream _timeStream;
  _DigitState _state;

  //TODO: dependency injection
  Digit(this._position, this._timeStream) {
    assert(_position > 0 && _position < 5);
  }

  @override
  State<StatefulWidget> createState() {
    _state = _DigitState();
    return _state;
  }
}

class _DigitState extends State<Digit> {
  int digit;
  Random rand = Random();

  @override
  void initState(){
    super.initState();
    digit = 0;
    widget._timeStream.addListener(() {
      var value = convert(widget._position, widget._timeStream.value);
      this.updateState(value);
    });
  }

  void updateState(int digit) {
    this.setState(() => this.digit = digit);
    // create a stack of images to show?
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
        child: Image.asset(
            "assets/images/digit${this.widget._position}/${this.widget._position}-${this.digit}.png",
            gaplessPlayback: true,
            fit: BoxFit.cover));
  }

  int convert(int position, DateTime dt){
    switch(position){
      case 1:
        return dt.hour ~/ 10;
      case 2:
        return dt.hour % 10;
      case 3:
        return dt.minute ~/ 10;
      case 4:
        return dt.minute % 10;
    }
  }

}
