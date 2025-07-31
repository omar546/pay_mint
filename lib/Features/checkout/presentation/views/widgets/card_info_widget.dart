import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/styles.dart';

class CardInfoWidget extends StatelessWidget {
  const CardInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset('assets/mastercard.svg'),
            const SizedBox(width: 23),
            Text.rich(
              TextSpan(
                style: Styles.style18,
                children: [
                  const TextSpan(text: 'Credit Card\n'),
                  const TextSpan(text: 'MasterCard **78'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
