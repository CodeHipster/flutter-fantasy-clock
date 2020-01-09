import 'dart:async';

import 'package:flutter/widgets.dart';

class MinuteNotifier extends ValueNotifier<DateTime> {

  Timer _timer;

  MinuteNotifier() :
    super(DateTime.now());

  // Recursive(ish)
  void _updateTime(){
    value = DateTime.now(); //Notifies listeners through super.
    //TODO: check for memory leak.
    _timer = Timer(
      Duration(minutes: 1) -
          Duration(seconds: value.second) -
          Duration(milliseconds: value.millisecond),
      _updateTime,
    );
  }

  @override
  void dispose(){
    super.dispose();
    _timer.cancel();
  }

  //TODO: is this thread safe?
  @override
  void addListener(listener) {
    if(!this.hasListeners){
      assert(_timer == null, "It should not be possible that there is already a timer.");
      if(_timer != null){
        _timer.cancel();
      }
      _updateTime();
    }
    super.addListener(listener);
  }

  //TODO: is this thread safe?
  @override
  void removeListener(VoidCallback listener){
    super.removeListener(listener);
    if(!this.hasListeners){
      _timer.cancel();
      _timer = null;
    }
  }
}