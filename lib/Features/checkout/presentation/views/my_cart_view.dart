import 'package:flutter/material.dart';
import 'package:pay_mint/Features/checkout/presentation/views/widgets/cart_info_item.dart';
import 'package:pay_mint/Features/checkout/presentation/views/widgets/custom_button.dart';
import 'package:pay_mint/Features/checkout/presentation/views/widgets/total_price_widget.dart';

import '../../../../core/utils/styles.dart';

class MyCartView extends StatelessWidget {
  const MyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text('My Cart', style: Styles.style25),
      ),
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
            CustomButton(onTap: () {}),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
