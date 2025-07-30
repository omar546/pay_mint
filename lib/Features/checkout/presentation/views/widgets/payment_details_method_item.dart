import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PaymentDetailsMethodItem extends StatelessWidget {
  final bool isActive;
  final String image;

  const PaymentDetailsMethodItem({
    super.key,
    this.isActive = false,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 100),
      width: 103,
      height: 62,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1.50,
            color: isActive ? const Color(0xff34a853) : Colors.grey,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        shadows:
            isActive
                ? const [
                  BoxShadow(
                    color: Color(0xff34a853),
                    blurRadius: 4,
                    offset: Offset(0, 0),
                    spreadRadius: 0,
                  ),
                ]
                : [],
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        child: Center(child: SvgPicture.asset(image)),
      ),
    );
  }
}
