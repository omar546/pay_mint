import 'package:flutter/material.dart';
import 'package:pay_mint/Features/checkout/presentation/views/widgets/thank_you_card.dart';

import 'custom_check_icon.dart';
import 'custom_dashed_line.dart';

class ThankYouViewBody extends StatelessWidget {
  const ThankYouViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          const ThankYouCard(),
          Positioned(left: 0, right: 0, top: -50, child: CustomCheckIcon()),
          Positioned(
            bottom: MediaQuery.sizeOf(context).height * 0.2,
            left: -20,
            child: CircleAvatar(backgroundColor: Colors.white),
          ),
          Positioned(
            bottom: MediaQuery.sizeOf(context).height * 0.2,
            right: -20,
            child: CircleAvatar(backgroundColor: Colors.white),
          ),
          Positioned(
            bottom: MediaQuery.sizeOf(context).height * 0.22,
            left: 28,
            right: 28,
            child: CustomDashedLine(),
          ),
        ],
      ),
    );
  }
}
