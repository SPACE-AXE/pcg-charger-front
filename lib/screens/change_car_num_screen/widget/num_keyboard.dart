import 'package:flutter/material.dart';
import 'package:pcg_charger/screens/change_car_num_screen/widget/keyboard_key.dart';

class NumKeyboard extends StatefulWidget {
  final Function(String) addCarnum;
  final Function() deleteCarNum;
  const NumKeyboard(
      {super.key, required this.addCarnum, required this.deleteCarNum});

  @override
  _NumKeyboardState createState() => _NumKeyboardState();
}

class _NumKeyboardState extends State<NumKeyboard> {
  final keys = [
    ['1', '2', '3'],
    ['4', '5', '6'],
    ['7', '8', '9'],
    ['', '0', Icon(Icons.keyboard_backspace)],
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      decoration: BoxDecoration(
        border: Border.all(
          color: Color(0xff39c5bb),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: keys
            .map(
              (x) => Row(
                children: x.map((y) {
                  return Expanded(
                    child: KeyboardKey(
                      label: y,
                      onTap: (val) {
                        val is Widget
                            ? widget.deleteCarNum()
                            : widget.addCarnum(val);
                      },
                      value: y,
                    ),
                  );
                }).toList(),
              ),
            )
            .toList(),
      ),
    );
  }
}
