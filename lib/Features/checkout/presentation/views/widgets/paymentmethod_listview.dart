import 'package:flutter/material.dart';
import 'package:pay_mint/Features/checkout/presentation/views/widgets/payment_details_method_item.dart';

class PaymentMethodsListView extends StatefulWidget {
  const PaymentMethodsListView({super.key});

  @override
  State<PaymentMethodsListView> createState() => _PaymentMethodsListViewState();
}

class _PaymentMethodsListViewState extends State<PaymentMethodsListView> {
  final List<String> paymentMethodItems = const [
    'assets/card.svg',
    'assets/paypal.svg',
  ];
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 62,
      child: ListView.builder(
        itemCount: paymentMethodItems.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  activeIndex = index;
                });
              },
              child: PaymentDetailsMethodItem(
                isActive: activeIndex == index,
                image: paymentMethodItems[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
