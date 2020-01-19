import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_clock_helper/model.dart';

import 'time-stream.dart';

import 'package:intl/intl.dart';

class Digit extends StatefulWidget {
  final int _position;
  final MinuteNotifier _minuteNotifier;
  final ClockModel _settings;

  Digit(this._position, this._minuteNotifier, this._settings) {
    assert(_position > 0 && _position < 5);
  }

  @override
  State<StatefulWidget> createState() => _DigitState();
}

class _DigitState extends State<Digit> {
  int digit;
  VoidCallback onMinuteChange;
  VoidCallback onSettingChanged;
  DateFormat hourFormat;

  @override
  void initState() {
    super.initState();
    hourFormat = _getHourFormat();
    digit = _convert(widget._minuteNotifier.value, this.hourFormat);
    onMinuteChange = () {
      var value = _convert(widget._minuteNotifier.value, this.hourFormat);
      this.setState(() => this.digit = value);
    };
    onSettingChanged = () {
      var hourFormat = this._getHourFormat();
      var value = _convert(widget._minuteNotifier.value, hourFormat);
      this.setState(() {
        this.hourFormat = hourFormat;
        this.digit = value;
      });
    };
    widget._minuteNotifier.addListener(onMinuteChange);
    widget._settings.addListener(onSettingChanged);
  }

  @override
  void dispose() {
    widget._minuteNotifier.removeListener(onMinuteChange);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final String theme = Theme.of(context).brightness == Brightness.light
        ?"light":"dark";

    print("rebuilding digit: $theme");
    return SizedBox.expand(
        child: Image.asset(
            "assets/images/$theme/digit${this.widget._position}/${this.widget._position}-${this.digit}.png",
            gaplessPlayback: true,
            fit: BoxFit.cover));
  }

  DateFormat _getHourFormat() {
    print("getting hour format");
    return DateFormat(widget._settings.is24HourFormat ? 'HH' : 'hh');
  }

  int _convert(DateTime dt, DateFormat hourFormat) {
    final hour = int.parse(hourFormat.format(dt));
    print("hour: $hour");
    switch (this.widget._position) {
      case 1:
        return hour ~/ 10;
      case 2:
        return hour % 10;
      case 3:
        return dt.minute ~/ 10;
      case 4:
        return dt.minute % 10;
      default:
        throw Exception("There can only be 4 digits in our clock.");
    }
  }
}
