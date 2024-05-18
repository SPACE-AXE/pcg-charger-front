import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pcg_charger/screens/homepage/widget/MyElevatedBtn.dart';

class NumCheck extends StatefulWidget {
  const NumCheck(
      {super.key,});
  @override
  State<NumCheck> createState() => _NumCheckState();
}

class _NumCheckState extends State<NumCheck> {
  bool _isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.15,
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 300), // �ִϸ��̼� ���� �ð�
          width: MediaQuery.of(context).size.width * 1, // Container�� �ʺ�
          height: _isExpanded
              ? MediaQuery.of(context).size.height * 0.2
              : MediaQuery.of(context).size.height * 0.4, // Container�� ����
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), // Container�� �𼭸��� �ձ۰� ó��
          ),
          child: _isExpanded
              ? Container(
                  width: MediaQuery.of(context).size.height * 0.2,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xff39c5bb),
                        width: 4,
                      ),
                      borderRadius: BorderRadius.circular(20)),
                  child: const TextField(
                    maxLength: 8,
                    maxLengthEnforcement: MaxLengthEnforcement.enforced,
                    decoration: InputDecoration(
                      counterText: '',
                      border: InputBorder.none,
                    ),
                    style: TextStyle(
                      letterSpacing: 20,
                      fontSize: 60,
                    ),
                  ),
                )
              : const CarNumber(), // ��ư�� ���� ������ ����
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.1,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MyElevatedBtn(title: "!23", text: "123",),
            MyElevatedBtn(
              title: "!23",
              text: "123",
            )
          ],
        )
      ],
    );
  }

  void expandControl() {
    setState(() {
      _isExpanded = !_isExpanded; // ��ư�� ���� ������ ���� ����
    });
  }
}

class CarNumber extends StatelessWidget {
  const CarNumber({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: const Color(0xff39c5bb),
          width: 4,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), // �׸��� ���� �� ������
            spreadRadius: 5, // �׸����� Ȯ�� �ݰ�
            blurRadius: 7, // �׸����� �帲 �ݰ�
            offset: const Offset(2, 6), // �׸����� ��ġ
          ),
        ],
        borderRadius: BorderRadius.circular(20),
      ),
      height: MediaQuery.of(context).size.height * 0.40,
      child: const Text("123 \n 123"),
    );
  }
}