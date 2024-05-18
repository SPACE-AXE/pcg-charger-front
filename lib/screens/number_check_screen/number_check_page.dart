import 'package:flutter/material.dart';
import 'package:pcg_charger/screens/number_check_screen/widget/animation_container.dart';

class NumberCheckScreen extends StatelessWidget {
  const NumberCheckScreen(
      {super.key,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.2,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              child: NumCheck(),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.2,
            ),
          ],
        ),
      ),
    );
  }
}