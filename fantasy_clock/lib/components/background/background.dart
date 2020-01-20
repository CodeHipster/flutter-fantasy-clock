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

import 'package:flutter/material.dart';

class Background extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BackgroundState();
}

class _BackgroundState extends State<Background> {
  @override
  Widget build(BuildContext context) {
    final String theme =
        Theme.of(context).brightness == Brightness.light ? "light" : "dark";

    return SizedBox.expand(
        child: Image.asset(
      "assets/images/$theme/background/background.png",
      gaplessPlayback: true,
      fit: BoxFit.cover,
    ));
  }
}
