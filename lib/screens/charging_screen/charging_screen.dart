import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pcg_charger/charge_data.dart';

import 'package:pcg_charger/screens/charging_screen/widget/ad_container.dart';
import 'package:pcg_charger/screens/charging_screen/widget/charging_status.dart';
import 'package:pcg_charger/screens/charging_screen/widget/end_charge.dart';

class ChargingScreen extends StatefulWidget {
  const ChargingScreen({super.key});

  @override
  State<ChargingScreen> createState() => _ChargingScreenState();
}

class _ChargingScreenState extends State<ChargingScreen> {
  bool isCharging = true;

  void setIsCharging() {
    setState(() {
      isCharging = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xff39c5bb),
        title: Text('pcg'),
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 30),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: SizedBox(),
            ),
            Expanded(
              flex: 8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AdContent(
                      isCharging: isCharging, setIsCharging: setIsCharging),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xff39c5bb),
                      ),
                    ),
                  ),
                  isCharging
                      ? Consumer(builder: (context, ref, child) {
                          ChargeData data = ref.read(chargeDataProvider);
                          return ChargingStatus(
                              data: data, setIsCharging: setIsCharging);
                        })
                      : EndCharge(),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}
