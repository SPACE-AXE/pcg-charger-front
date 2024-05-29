import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pcg_charger/charge_data.dart';
import 'package:pcg_charger/screens/homepage/widget/MyElevatedBtn.dart';

class NumCheck extends StatefulWidget {
  const NumCheck({
    super.key,
  });
  @override
  State<NumCheck> createState() => _NumCheckState();
}

class _NumCheckState extends State<NumCheck> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.15,
        ),
        Container(
          width: MediaQuery.of(context).size.width * 1, // Container�� �ʺ�
          height: MediaQuery.of(context).size.height * 0.4, // Container�� ����
          decoration: BoxDecoration(
            borderRadius:
                BorderRadius.circular(10), // Container�� �𼭸��� �ձ۰� ó��
          ),
          child: Consumer(
            builder: (context, ref, child) {
              String carNum = ref.read(chargeDataProvider).carNum!;
              return CarNumber(
                carNum: carNum,
              );
            },
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.1,
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(flex: 1, child: SizedBox()),
            Expanded(
              flex: 3,
              child: MyElevatedBtn(
                title: "예",
                text: "예",
                navigator: "/selectoption",
              ),
            ),
            Expanded(flex: 1, child: SizedBox()),
            Expanded(
              flex: 3,
              child: MyElevatedBtn(
                title: "아니오",
                text: "아니오",
                navigator: '/changecarnum',
              ),
            ),
            Expanded(flex: 1, child: SizedBox()),
          ],
        )
      ],
    );
  }
}

class CarNumber extends StatelessWidget {
  final String carNum;
  CarNumber({
    super.key,
    required this.carNum,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 1, child: SizedBox()),
        Expanded(
          flex: 8,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: const Color(0xff39c5bb),
                width: 4,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(2, 6),
                ),
              ],
              borderRadius: BorderRadius.circular(20),
            ),
            height: MediaQuery.of(context).size.height * 0.40,
            child: Center(
              child: Text(
                textAlign: TextAlign.center,
                "$carNum \n 이 번호가 맞습니까?",
                style: TextStyle(
                  fontSize: 40,
                ),
              ),
            ),
          ),
        ),
        Expanded(flex: 1, child: SizedBox()),
      ],
    );
  }
}
