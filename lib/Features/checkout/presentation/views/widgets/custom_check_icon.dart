import 'package:flutter/material.dart';

class CustomCheckIcon extends StatelessWidget {
  const CustomCheckIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 50,
      backgroundColor: Color(0xffd9d9d9),
      child: CircleAvatar(
        radius: 40,
        backgroundColor: Color(0xff34a853),
        child: Icon(Icons.check, color: Colors.white, size: 66),
      ),
    );
  }
}
