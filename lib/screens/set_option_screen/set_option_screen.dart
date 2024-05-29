import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pcg_charger/charge_data.dart';
import 'package:pcg_charger/widget/app_bar.dart';

final priceOptions = [
  '1',
  '2',
  '3',
  '4',
  '5',
  '6',
  '7',
  '기타',
];
final timeOptions = [
  '10',
  '20',
  '30',
  '40',
  '50',
  '60',
  '70',
  '기타',
];
final amountOptions = [
  '10',
  '20',
  '30',
  '40',
  '50',
  '60',
  '70',
  '기타',
];

class SetOptionScreen extends ConsumerWidget {
  const SetOptionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Widget makeWidgetList() {
      final option = ref.read(chargeDataProvider).chargeOption;
      List<Widget> list = [];
      debugPrint("option: $option");

      switch (option) {
        case 'price':
          debugPrint("option: $option");
          list = priceOptions.map((option) {
            return Consumer(builder: (context, ref, child) {
              return ElevatedButton(
                style: ElevatedButton.styleFrom(
                  alignment: Alignment.center,
                  fixedSize: const Size(100, 100),
                  backgroundColor: const Color(0xff39c5bb),
                  foregroundColor: Colors.white,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text(
                  option == '기타' ? '$option' : '$option 만원',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () async {
                  ref.read(chargeDataProvider).setOption('price', option);
                  Navigator.pushNamed(context, '/charging');
                },
              );
            });
          }).toList();
          break;
        case 'time':
          debugPrint("option: $option");
          list = timeOptions.map((option) {
            return Consumer(builder: (context, ref, child) {
              return ElevatedButton(
                style: ElevatedButton.styleFrom(
                  alignment: Alignment.center,
                  fixedSize: const Size(100, 100),
                  backgroundColor: const Color(0xff39c5bb),
                  foregroundColor: Colors.white,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text(
                  option == '기타' ? '$option' : '$option 분',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () async {
                  ref.read(chargeDataProvider).setOption('time', option);
                  Navigator.pushNamed(context, '/charging');
                },
              );
            });
          }).toList();
          break;
        case 'amount':
          debugPrint("option: $option");
          list = amountOptions.map((option) {
            return Consumer(builder: (context, ref, child) {
              return ElevatedButton(
                style: ElevatedButton.styleFrom(
                  alignment: Alignment.center,
                  fixedSize: const Size(100, 100),
                  backgroundColor: const Color(0xff39c5bb),
                  foregroundColor: Colors.white,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text(
                  option == '기타' ? '$option' : '$option Kwh',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () async {
                  ref.read(chargeDataProvider).setOption('amount', option);
                  Navigator.pushNamed(context, '/charging');
                },
              );
            });
          }).toList();
          break;
      }
      Widget widget = Expanded(
        flex: 6,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: list.sublist(0, 4),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: list.sublist(4, 8),
            ),
          ],
        ),
      );
      return widget;
    }

    return Scaffold(
      appBar: MyAppBar(title: 'pcg'),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Text(
              "충전량을 선택하여 주십시오.",
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          ),
          makeWidgetList(),
        ],
      ),
    );
  }
}
