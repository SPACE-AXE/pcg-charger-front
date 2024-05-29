import 'package:flutter/material.dart';

class KeyboardKey extends StatefulWidget {
  final dynamic label;
  final dynamic value;
  final ValueSetter<dynamic> onTap;

  KeyboardKey({
    required this.label,
    required this.onTap,
    required this.value,
  })  : assert(label != null),
        assert(onTap != null),
        assert(value != null);

  @override
  _KeyboardKeyState createState() => _KeyboardKeyState();
}

class _KeyboardKeyState extends State<KeyboardKey> {
  renderLabel() {
    if (widget.label is String) {
      return Text(
        widget.label,
        style: TextStyle(
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
        ),
      );
    } else {
      return widget.label;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onTap(widget.value);
      },
      child: AspectRatio(
        aspectRatio: 1.8,
        child: Container(
          child: Center(
            child: renderLabel(),
          ),
        ),
      ),
    );
  }
}
