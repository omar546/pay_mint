import 'package:flutter/material.dart';

class CustomDashedLine extends StatelessWidget {
  const CustomDashedLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 4,
      children: List.generate(
        30,
        (index) =>
            Expanded(child: Container(height: 1, color: Color(0xffb8b8b8))),
      ),
    );
  }
}
