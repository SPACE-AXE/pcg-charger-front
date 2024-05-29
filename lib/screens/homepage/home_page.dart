import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pcg_charger/charge_data.dart';
import 'package:pcg_charger/widget/app_bar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: widget.title),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 300,
              height: 168,
              child: Consumer(
                builder: (context, ref, child) {
                  ChargeData data = ChargeData.makeData('38서 6107');
                  debugPrint("data: ${data.carNum}");
                  ref.read(chargeDataProvider).updateChargeData(data);
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
                      Navigator.pushNamed(context, '/changecarnum');
                    },
                    child: Text(
                      "충전 시작",
                      style: const TextStyle(fontSize: 30),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
