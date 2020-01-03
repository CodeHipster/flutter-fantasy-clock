
import 'package:flutter/widgets.dart';

class Digit extends StatefulWidget {

  final int position;

  Digit(this.position){
    assert(position > 0 && position < 5);
  }

  @override
  State<StatefulWidget> createState() => DigitState();
}

class DigitState extends State<Digit> {
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(child: Image.asset("assets/images/digit${this.widget.position}/${this.widget.position}-2.png",fit:BoxFit.cover));
  }
}