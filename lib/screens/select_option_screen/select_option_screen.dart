import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pcg_charger/charge_data.dart';
import 'package:pcg_charger/screens/homepage/widget/MyElevatedBtn.dart';
import 'package:pcg_charger/widget/app_bar.dart';

class SelectOptionScreen extends StatefulWidget {
  const SelectOptionScreen({
    super.key,
  });

  @override
  State<SelectOptionScreen> createState() => _SelectOptionScreenState();
}

class _SelectOptionScreenState extends State<SelectOptionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'pcg'),
      body: Center(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Text(
                "충전량을 설정할 방식을 선택하여 주십시오.",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Expanded(
              flex: 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 130,
                    height: 240,
                    child: Consumer(
                      builder: (context, ref, child) {
                        ref.read(chargeDataProvider).updateOption('price');
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
                          onPressed: () async {
                            // ref.read(chargeDataProvider).updateOption('price');
                            // Navigator.pushNamed(context, '/setoption');
                          },
                          child: Text(
                            "금액\n설정",
                            style: const TextStyle(fontSize: 30),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    width: 130,
                    height: 240,
                    child: Consumer(builder: (context, ref, child) {
                      ref.read(chargeDataProvider).updateOption('time');
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
                        onPressed: () async {
                          ref.read(chargeDataProvider).updateOption('time');
                          Navigator.pushNamed(context, '/setoption');
                        },
                        child: Text(
                          "시간\n설정",
                          style: const TextStyle(fontSize: 30),
                        ),
                      );
                    }),
                  ),
                  SizedBox(
                    width: 130,
                    height: 240,
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
                        onPressed: () async {
                          //   ref.read(chargeDataProvider).updateOption('amount');
                          // Navigator.pushNamed(context, '/setoption');
                        },
                        child: Text(
                          "용량\n설정",
                          style: const TextStyle(fontSize: 30),
                        ),
                      );
                    }),
                  ),
                  SizedBox(
                    width: 130,
                    height: 240,
                    child: MyElevatedBtn(
                      title: "full",
                      text: "가득\n충전",
                    ),
                  ),
                ],
              ),
            ),
            Expanded(flex: 1, child: SizedBox()),
            Expanded(
              flex: 2,
              child: Text(
                "충전 요금: 10 / Kwh",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                "모든 충전 방식은 충전량에 비례하여 요금이 책정됩니다.\n충전중에는 사전정산이 불가능합니다.",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
