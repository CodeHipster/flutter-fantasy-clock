// Copyright 2020 Thijs Oostdam
//
//Licensed under the Apache License, Version 2.0 (the "License");
//you may not use this file except in compliance with the License.
//You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
//Unless required by applicable law or agreed to in writing, software
//distributed under the License is distributed on an "AS IS" BASIS,
//WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//See the License for the specific language governing permissions and
//limitations under the License.

import 'package:fantasy_clock/components/time/minute-notifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

class _TimeState extends State<Time> {
  final MinuteNotifier _timeStream = MinuteNotifier();
  final List<Digit> digits = new List(4);

  @override
  void initState() {
    super.initState();
    digits[0] = Digit(1, _timeStream, widget._clockSettings);
    digits[1] = Digit(2, _timeStream, widget._clockSettings);
    digits[2] = Digit(3, _timeStream, widget._clockSettings);
    digits[3] = Digit(4, _timeStream, widget._clockSettings);
  }

  @override
  Widget build(BuildContext context) {
    final String theme =
    Theme.of(context).brightness == Brightness.light ? "light" : "dark";
    var stack = Stack(children: [
      digits[0],
      digits[1],
      SizedBox.expand(child: Image.asset("assets/images/$theme/colon.png",gaplessPlayback: true,
          fit: BoxFit.cover)),
      digits[2],
      digits[3],
    ]);
    return stack;
  }

  @override
  void dispose() {
    super.dispose();
    _timeStream.dispose();
  }
}
