import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pcg_charger/charge_data.dart';
import 'package:pcg_charger/screens/charging_screen/widget/ad_slider.dart';
import 'package:pcg_charger/screens/homepage/widget/MyElevatedBtn.dart';

class AdContent extends StatefulWidget {
  bool isCharging;
  final Function() setIsCharging;
  AdContent({super.key, required this.isCharging, required this.setIsCharging});

  @override
  State<AdContent> createState() => _AdContentState();
}

class _AdContentState extends State<AdContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 3,
          child: Container(
            width: 300,
            decoration: BoxDecoration(
              border: Border.all(
                color: Color(0xff39c5bb),
              ),
            ),
            child: AdSliderWidget(),
          ),
        ),
        Expanded(flex: 1, child: SizedBox()),
        Expanded(
          flex: 1,
          child: SizedBox(
            width: 300,
            child: Consumer(builder: (context, ref, child) {
              return ElevatedButton(
                style: ElevatedButton.styleFrom(
                  alignment: Alignment.center,
                  fixedSize: const Size(180, 80),
                  backgroundColor: const Color(0xff39c5bb),
                  foregroundColor: Colors.white,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  debugPrint("ref: ${ref.read(chargeDataProvider).toJson()}");
                  widget.isCharging
                      ? widget.setIsCharging()
                      : Navigator.pushNamed(
                          context,
                          "/",
                        );
                },
                child: Text(
                  widget.isCharging ? "충전 중지" : "충전 종료",
                  style: const TextStyle(fontSize: 30),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
