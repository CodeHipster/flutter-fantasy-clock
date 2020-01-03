//stateless container widget
// contains stateless background widget
// contains stateful time widget

//webp animation
//background image
//background animation

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_clock_helper/model.dart';

import 'components/background/background.dart';
import 'components/time/time.dart';

class FantasyClock extends StatefulWidget {
  final ClockModel model;

  const FantasyClock(this.model);

  @override
  State<StatefulWidget> createState() => FantasyClockState();
}

class FantasyClockState extends State<FantasyClock>{

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          Background(),
          Time()
        ]
    );
  }

}