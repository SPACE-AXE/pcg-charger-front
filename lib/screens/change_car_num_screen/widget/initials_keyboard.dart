import 'package:flutter/material.dart';
import 'package:pcg_charger/screens/change_car_num_screen/widget/keyboard_key.dart';

class InitialsKeyboard extends StatefulWidget {
  final Function(String) addCarnum;
  final Function() deleteCarNum;
  const InitialsKeyboard(
      {super.key, required this.addCarnum, required this.deleteCarNum});

  @override
  _InitialsKeyboardState createState() => _InitialsKeyboardState();
}

class _InitialsKeyboardState extends State<InitialsKeyboard> {
  final keys = [
    ['ㄱ', 'ㄴ', 'ㄷ', 'ㅏ', 'ㅓ'],
    ['ㄹ', 'ㅁ', 'ㅂ', 'ㅗ', 'ㅜ'],
    ['ㅅ', 'ㅇ', 'ㅈ', '', ''],
    ['', '', '', '', Icon(Icons.keyboard_backspace)],
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 330,
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
