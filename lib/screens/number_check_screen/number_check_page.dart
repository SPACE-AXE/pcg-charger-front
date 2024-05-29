import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pcg_charger/widget/app_bar.dart';
import 'package:pcg_charger/screens/number_check_screen/widget/num_check.dart';

class NumberCheckScreen extends ConsumerWidget {
  final String title;
  const NumberCheckScreen({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: MyAppBar(title: title),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.2,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              child: NumCheck(),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.2,
            ),
          ],
        ),
      ),
    );
  }
}
