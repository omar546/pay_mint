import 'package:flutter/cupertino.dart';
import 'package:pay_mint/Features/checkout/presentation/views/widgets/paymentmethod_listview.dart';

import 'custom_button_bloc_consumer.dart';

class PaymentMethodsBottomSheet extends StatelessWidget {
  const PaymentMethodsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        spacing: 32,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 16),
          PaymentMethodsListView(),
          CustomButtonBlocConsumer(),
        ],
      ),
    );
  }
}
