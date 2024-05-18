import 'package:flutter/material.dart';
import 'package:pcg_charger/screens/homepage/widget/MyElevatedBtn.dart';

class CarNumScreen extends StatelessWidget {
  const CarNumScreen({super.key,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 300,
              height: 168,
              child: MyElevatedBtn(
                title: "123",
                text: "123",
              ),
            )
          ],
        ),
      ),
    );
  }
}