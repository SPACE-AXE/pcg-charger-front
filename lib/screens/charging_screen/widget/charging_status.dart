import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pcg_charger/charge_data.dart';

class ChargingStatus extends ConsumerStatefulWidget {
  final data;
  final Function() setIsCharging;
  const ChargingStatus({
    super.key,
    required this.data,
    required this.setIsCharging,
  });

  @override
  _ChargingStatusState createState() => _ChargingStatusState();
}

class _ChargingStatusState extends ConsumerState<ChargingStatus> {
  int chargeTime = 0;
  int chargeAmount = 0;
  int chargePrice = 0;
  int setTime = 0;

  @override
  void initState() {
    super.initState();
    setState(() {
      setTime = int.parse(widget.data.setTime);
    });
    Timer.periodic(const Duration(seconds: 1), (timer) {
      update();
      ref.read(chargeDataProvider).updateCharge(
            chargeTime.toString(),
            chargePrice.toString(),
            chargeAmount.toString(),
          );
      if (setTime + 1 == chargeTime) {
        widget.setIsCharging();
      }
    });
  }

  void update() {
    if (mounted) {
      setState(() {
        chargeTime++;
        chargeAmount++;
        chargePrice += 100;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Color(0xff39c5bb),
        ),
      ),
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Icon(
              Icons.battery_charging_full_sharp,
              size: 70,
            ),
          ),
          Expanded(
            flex: 3,
            child: SizedBox(
              width: 300,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    child: Consumer(builder: (context, ref, child) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "설정 시간",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.start,
                          ),
                          Text(
                            "$setTime 분",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.start,
                          ),
                          Text(
                            "충전 요금",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.start,
                          ),
                          Text(
                            "$chargePrice 원",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ],
                      );
                    }),
                  ),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "충전 시간",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        Text(
                          "$chargeTime 분",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        Text(
                          "충전량",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        Text(
                          "$chargeAmount / Kwh",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
