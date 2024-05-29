import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CurrentTime extends StatefulWidget {
  const CurrentTime({super.key});

  @override
  State<CurrentTime> createState() => _CurrentTimeState();
}

class _CurrentTimeState extends State<CurrentTime> {
  String _currentTime = "";

  @override
  void initState() {
    super.initState();
    _updateTime(); // �ʱ� �ð� ����
    // 1�ʸ��� ���� �ð� ����
    Timer.periodic(const Duration(seconds: 1), (timer) {
      _updateTime();
    });
  }

  // ���� �ð� ����
  void _updateTime() {
    if (mounted) {
      // State ��ü�� ������ ���� Ʈ���� �ִ��� Ȯ��
      setState(() {
        _currentTime = DateFormat.Hms().format(DateTime.now());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _currentTime,
      style: TextStyle(color: Colors.white),
    );
  }
}
