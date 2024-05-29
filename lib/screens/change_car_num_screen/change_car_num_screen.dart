import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pcg_charger/charge_data.dart';
import 'package:pcg_charger/screens/change_car_num_screen/widget/keyboard_container.dart';
import 'package:pcg_charger/screens/homepage/widget/MyElevatedBtn.dart';
import 'package:pcg_charger/widget/app_bar.dart';

class ChangeCarNumScreen extends StatefulWidget {
  const ChangeCarNumScreen({super.key});

  @override
  State<ChangeCarNumScreen> createState() => _ChangeCarNumScreenState();
}

class _ChangeCarNumScreenState extends State<ChangeCarNumScreen> {
  final List<String> initials = [
    'ㄱ',
    'ㄲ',
    'ㄴ',
    'ㄷ',
    'ㄸ',
    'ㄹ',
    'ㅁ',
    'ㅂ',
    'ㅃ',
    'ㅅ',
    'ㅆ',
    'ㅇ',
    'ㅈ',
    'ㅉ',
    'ㅊ',
    'ㅋ',
    'ㅌ',
    'ㅍ',
    'ㅎ'
  ];
  final List<String> vowels = [
    'ㅏ',
    'ㅐ',
    'ㅑ',
    'ㅒ',
    'ㅓ',
    'ㅔ',
    'ㅕ',
    'ㅖ',
    'ㅗ',
    'ㅘ',
    'ㅙ',
    'ㅚ',
    'ㅛ',
    'ㅜ',
    'ㅝ',
    'ㅞ',
    'ㅟ',
    'ㅠ',
    'ㅡ',
    'ㅢ',
    'ㅣ'
  ];
  String carNum = '';
  final int baseCode = 0xAC00;

  void addCarNum(String value) {
    if (value == 'ㅏ' || value == 'ㅓ' || value == 'ㅗ' || value == 'ㅜ') {
      final tmp = carNum.substring(carNum.length - 1);
      carNum = carNum.substring(0, carNum.length - 1);
      int initialIndex = initials.indexOf(tmp);
      int vowelIndex = vowels.indexOf(value);

      int unicode = baseCode + (initialIndex * 21 * 28) + (vowelIndex * 28);
      setState(() {
        carNum += String.fromCharCode(unicode);
      });
    } else {
      setState(() {
        carNum += value;
      });
    }
    debugPrint("마지막문자:${carNum.substring(carNum.length - 1)}");
  }

  void deleteCarNum() {
    setState(() {
      carNum = carNum.substring(0, carNum.length - 1);
    });
    debugPrint(carNum);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'pcg'),
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: SizedBox(),
              ),
              Expanded(
                flex: 3,
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
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: Center(
                    child: Text(
                      "$carNum",
                      style: TextStyle(
                        fontSize: 40,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: SizedBox(),
              ),
              Expanded(
                flex: 1,
                child: Consumer(
                  builder: (context, ref, child) {
                    ref.read(chargeDataProvider).updateCarNum(carNum);
                    debugPrint("${ref.read(chargeDataProvider)}");
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
                        Navigator.pushNamed(context, '/selectoption');
                      },
                      child: Text(
                        "확인",
                        style: const TextStyle(fontSize: 30),
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                flex: 1,
                child: SizedBox(),
              ),
            ],
          ),
          SizedBox(
            height: 50,
          ),
          KeyboardContainer(addCarNum: addCarNum, deleteCarNum: deleteCarNum),
        ],
      ),
    );
  }
}
