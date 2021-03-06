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


///Wrapping widget for showing an image fullscreen.
import 'package:flutter/cupertino.dart';

class ClockFitImage extends StatelessWidget {
  final String _image;

  ClockFitImage(this._image);

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
        child:
//        Image.asset(this._image, gaplessPlayback: true, fit: BoxFit.cover));
        Image.asset(this._image, fit: BoxFit.cover));
  }
}
