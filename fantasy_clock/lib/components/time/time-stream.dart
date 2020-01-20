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

import 'dart:async';

import 'package:flutter/widgets.dart';

class MinuteNotifier extends ValueNotifier<DateTime> {
  Timer _timer;

  MinuteNotifier() : super(DateTime.now());

  // Recursive(ish)
  void _updateTime() {
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
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  void addListener(listener) {
    if (!this.hasListeners) {
      assert(_timer == null,
          "It should not be possible that there is already a timer.");
      if (_timer != null) {
        _timer.cancel();
      }
      _updateTime();
    }
    super.addListener(listener);
  }

  @override
  void removeListener(VoidCallback listener) {
    super.removeListener(listener);
    if (!this.hasListeners) {
      _timer.cancel();
      _timer = null;
    }
  }
}
