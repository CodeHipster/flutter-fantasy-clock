import 'dart:async';

import 'package:flutter/widgets.dart';

class TimeStream  extends ValueNotifier<DateTime> {

  TimeStream() :
    super(DateTime.now()){
    _updateTime();
  }

  void _updateTime(){
    print("updating time");
    value = DateTime.now();
    Timer(
      Duration(seconds: 1),
      _updateTime,
    );
//    Timer(
//      Duration(minutes: 1) -
//          Duration(seconds: value.second) -
//          Duration(milliseconds: value.millisecond),
//      _updateTime,
//    );
    notifyListeners();
  }
}