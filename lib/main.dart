import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pcg_charger/park_data.dart';
import 'package:pcg_charger/screens/change_car_num_screen/change_car_num_screen.dart';
import 'package:pcg_charger/screens/charging_screen/charging_screen.dart';
import 'package:pcg_charger/screens/homepage/home_page.dart';
import 'package:pcg_charger/screens/number_check_screen/number_check_page.dart';
import 'package:pcg_charger/screens/select_option_screen/select_option_screen.dart';
import 'package:pcg_charger/screens/set_option_screen/set_option_screen.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:http/http.dart' as http;

void main() {
  runApp(
    const ProviderScope(
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  late IO.Socket socket;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    getData();
  }

  @override
  Widget build(BuildContext context) {
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

  void getData() async {
    String url = 'https://api.parkchargego.link/api/v1/park/info';
    Uri uri = Uri.parse(url);
    http.Response response = await http.get(
      uri,
      headers: {'manage-code': "asdf"},
    );
    ref.read(parkDataProvider).updateParkData(
          ParkData.fromJson(
            jsonDecode(response.body),
          ),
        );
    final ip = ref.read(parkDataProvider).ip;
    debugPrint("http://$ip:6000");
    IO.Socket socket = IO.io(
      'http://${ref.read(parkDataProvider).ip}:6000',
      <String, dynamic>{
        'transports': ['websocket'],
        'autoConnect': true,
        'extraHeaders': {'manage-code': 'asdf'}
      },
    );
    socket.on('connect', (_) {
      debugPrint('connected to the server');
    });

    socket.on('disconnect', (reason) {
      debugPrint('disconnected $reason');
    });

    socket.on('error', (error) {
      debugPrint('Error: $error');
    });

    ref.read(parkDataProvider).updateSocket(socket);
  }
}
