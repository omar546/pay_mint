import 'package:flutter/cupertino.dart';
import 'package:pay_mint/Features/checkout/presentation/views/widgets/paymentmethod_listview.dart';

import 'custom_button_bloc_consumer.dart';

class PaymentMethodsBottomSheet extends StatefulWidget {
  const PaymentMethodsBottomSheet({super.key});

  @override
  State<PaymentMethodsBottomSheet> createState() =>
      _PaymentMethodsBottomSheetState();
}

class _PaymentMethodsBottomSheetState extends State<PaymentMethodsBottomSheet> {
  bool isPaypal = false;

  updatePaymentMethod({required int index}) {
    if (index == 0) {
      isPaypal = false;
    } else {
      isPaypal = true;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        spacing: 32,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 16),
          PaymentMethodsListView(updatePaymentMethod: updatePaymentMethod),
          CustomButtonBlocConsumer(isPaypal: isPaypal),
        ],
      ),
    );
  }
}
