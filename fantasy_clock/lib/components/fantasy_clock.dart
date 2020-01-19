import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_clock_helper/model.dart';

import 'background/background.dart';
import 'foreground/foreground.dart';
import 'time/time.dart';

class FantasyClock extends StatefulWidget {
  final ClockModel _clockSettings;

  const FantasyClock(this._clockSettings);

  @override
  State<StatefulWidget> createState() => FantasyClockState();
}

class FantasyClockState extends State<FantasyClock>{

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          Background(),
          Time(widget._clockSettings),
          Foreground()
        ]
    );
  }

}