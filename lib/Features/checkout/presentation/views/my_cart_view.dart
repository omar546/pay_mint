import 'package:flutter/material.dart';
import 'package:pay_mint/Features/checkout/presentation/views/payment_details_view.dart';
import 'package:pay_mint/Features/checkout/presentation/views/widgets/cart_info_item.dart';
import 'package:pay_mint/Features/checkout/presentation/views/widgets/custom_app_bar.dart';
import 'package:pay_mint/Features/checkout/presentation/views/widgets/custom_button.dart';
import 'package:pay_mint/Features/checkout/presentation/views/widgets/total_price_widget.dart';

class MyCartView extends StatelessWidget {
  const MyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: 'My Cart'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            const SizedBox(height: 18),
            Image.asset('assets/basket.png'),
            const SizedBox(height: 25),
            const OrderInfoItem(title: 'Order Subtotal', value: r'$42.97'),
            const SizedBox(height: 3),
            const OrderInfoItem(title: 'Discount', value: r'$0'),
            const SizedBox(height: 3),
            const OrderInfoItem(title: 'Shipping', value: r'$9'),
            Divider(thickness: 2, color: Color(0xffc7c7c7), height: 34),
            TotalPrice(title: 'Total', value: r'$51.97'),
            const Spacer(),
            CustomButton(
              text: 'Complete Payment',
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return PaymentDetailsView();
                    },
                  ),
                );
              },
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
