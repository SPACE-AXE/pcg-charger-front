import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pcg_charger/charge_data.dart';

class EndCharge extends ConsumerStatefulWidget {
  const EndCharge({super.key});

  @override
  _EndChargeState createState() => _EndChargeState();
}

class _EndChargeState extends ConsumerState<EndCharge> {
  @override
  void initState() {
    super.initState();
    debugPrint("${ref.read(chargeDataProvider).toJson()}");
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
            child: Text(
              "38서 6107",
              style: TextStyle(fontSize: 30),
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "충전량",
                          style: TextStyle(fontSize: 25),
                          textAlign: TextAlign.start,
                        ),
                        Text(
                          "충전 요금",
                          style: TextStyle(fontSize: 25),
                          textAlign: TextAlign.start,
                        ),
                        Text(
                          "총 요금",
                          style: TextStyle(fontSize: 25),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xff39c5bb),
                        width: 3,
                      ),
                    ),
                  ),
                  Container(
                    child: Consumer(builder: (context, ref, child) {
                      ChargeData data = ref.read(chargeDataProvider);
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${data.chargeAmount} / Kwh",
                            style: TextStyle(fontSize: 25),
                            textAlign: TextAlign.start,
                          ),
                          Text(
                            "${data.chargeTime} 분",
                            style: TextStyle(fontSize: 25),
                            textAlign: TextAlign.start,
                          ),
                          Text(
                            "${data.chargePrice} 원",
                            style: TextStyle(fontSize: 25),
                            textAlign: TextAlign.start,
                          ),
                        ],
                      );
                    }),
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
