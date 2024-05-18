import 'package:flutter/material.dart';
import 'package:pcg_charger/screens/car_num_screen/car_num_screen.dart';
import 'package:pcg_charger/screens/homepage/widget/MyElevatedBtn.dart';
import 'package:pcg_charger/screens/homepage/widget/app_bar.dart';
import 'package:pcg_charger/screens/number_check_screen/number_check_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: widget.title),
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 300,
              height: 168,
              child: ElevatedButton(onPressed: (){
                Navigator.pushNamed(context, '/carnum');
              }, child: Text('충전시작'),),
            )
          ],
        ),
      ),
    );
  }
}