import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pcg_charger/screens/change_car_num_screen/change_car_num_screen.dart';
import 'package:pcg_charger/screens/charging_screen/charging_screen.dart';
import 'package:pcg_charger/screens/homepage/home_page.dart';
import 'package:pcg_charger/screens/number_check_screen/number_check_page.dart';
import 'package:pcg_charger/screens/select_option_screen/select_option_screen.dart';
import 'package:pcg_charger/screens/set_option_screen/set_option_screen.dart';

void main() {
  runApp(
    const ProviderScope(
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ref.read(chargeDataProvider).updateChargeData(ChargeData.makeData());

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'pcg_charger_front',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(title: 'pcg'),
        '/checknum': (context) => NumberCheckScreen(
              title: 'pcg',
            ),
        '/changecarnum': (context) => ChangeCarNumScreen(),
        '/selectoption': (context) => SelectOptionScreen(),
        '/setoption': (context) => SetOptionScreen(),
        '/charging': (context) => const ChargingScreen(),
      },
    );
  }
}
