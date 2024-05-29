import 'package:flutter/material.dart';

class MyElevatedBtn extends StatefulWidget {
  final String? navigator;
  final String title;
  final String text;
  final String? carNum;

  const MyElevatedBtn({
    super.key,
    required this.title,
    required this.text,
    this.navigator,
    this.carNum,
  });

  @override
  State<MyElevatedBtn> createState() => _MyElevatedBtnState();
}

class _MyElevatedBtnState extends State<MyElevatedBtn> {
  @override
  Widget build(BuildContext context) {
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
        widget.navigator == null
            ? null
            : Navigator.pushNamed(context, '${widget.navigator}');
      },
      child: Text(
        widget.text,
        style: const TextStyle(fontSize: 30),
      ),
    );
  }
}
