import 'dart:async';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pcg_charger/screens/car_num_screen/car_num_screen.dart';
import 'package:pcg_charger/screens/homepage/home_page.dart';
import 'package:pcg_charger/screens/number_check_screen/number_check_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'pcg_charger_front',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => const MyHomePage(title: 'pcg'),
        '/carnum': (context) => const NumberCheckScreen(),
      },
    );
  }
}