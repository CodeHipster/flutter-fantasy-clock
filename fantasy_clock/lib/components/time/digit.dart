import 'package:flutter/widgets.dart';

import 'time-stream.dart';

class Digit extends StatefulWidget {
  final int _position;
  final MinuteNotifier _minuteNotifier;

  Digit(this._position, this._minuteNotifier) {
    assert(_position > 0 && _position < 5);
  }

  @override
  State<StatefulWidget> createState() => _DigitState();
}

class _DigitState extends State<Digit> {
  int digit;
  VoidCallback onMinuteChange;

  @override
  void initState(){
    super.initState();
    digit = convert(widget._minuteNotifier.value);
    onMinuteChange = () {
      var value = convert(widget._minuteNotifier.value);
      this.setState(() => this.digit = value);
    };
    widget._minuteNotifier.addListener(onMinuteChange);
  }

  @override
  void dispose(){
    widget._minuteNotifier.removeListener(onMinuteChange);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
        child: Image.asset(
            "assets/images/digit${this.widget._position}/${this.widget._position}-${this.digit}.png",
            gaplessPlayback: true,
            fit: BoxFit.cover));
  }

  int convert(DateTime dt){
    switch(this.widget._position){
      case 1:
        return dt.hour ~/ 10;
      case 2:
        return dt.hour % 10;
      case 3:
        return dt.minute ~/ 10;
      case 4:
        return dt.minute % 10;
      default:
        throw Exception("There can only be 4 digits in our clock.");
    }
  }
}
