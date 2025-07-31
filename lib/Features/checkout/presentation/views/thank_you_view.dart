import 'package:flutter/material.dart';
import 'package:pay_mint/Features/checkout/presentation/views/widgets/custom_app_bar.dart';
import 'package:pay_mint/Features/checkout/presentation/views/widgets/thank_you_view_body.dart';

class ThankYouView extends StatelessWidget {
  const ThankYouView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: Transform.translate(
        offset: const Offset(0, -16),
        child: ThankYouViewBody(),
      ),
    );
  }
}
