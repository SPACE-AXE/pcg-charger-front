import 'package:flutter/material.dart';
import 'package:pcg_charger/screens/change_car_num_screen/widget/initials_keyboard.dart';
import 'package:pcg_charger/screens/change_car_num_screen/widget/num_keyboard.dart';

class KeyboardContainer extends StatefulWidget {
  final Function(String) addCarNum;
  final Function() deleteCarNum;
  const KeyboardContainer(
      {super.key, required this.addCarNum, required this.deleteCarNum});

  @override
  State<KeyboardContainer> createState() => _KeyboardContainerState();
}

class _KeyboardContainerState extends State<KeyboardContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InitialsKeyboard(
              addCarnum: widget.addCarNum, deleteCarNum: widget.deleteCarNum),
          // VowelsKeyboard(setCarNum: widget.setCarNum),
          NumKeyboard(
              addCarnum: widget.addCarNum, deleteCarNum: widget.deleteCarNum),
        ],
      ),
    );
  }
}
