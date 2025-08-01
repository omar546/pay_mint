import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:pay_mint/Features/checkout/data/models/amount_model.dart';
import 'package:pay_mint/Features/checkout/data/models/item_list_model.dart';
import 'package:pay_mint/Features/checkout/presentation/views/my_cart_view.dart';
import 'package:pay_mint/Features/checkout/presentation/views/thank_you_view.dart';
import 'package:pay_mint/core/utils/api_key.dart';

import '../../../data/models/payment_intent_input_model.dart';
import '../../manager/payment_cubit.dart';
import 'custom_button.dart';

class CustomButtonBlocConsumer extends StatelessWidget {
  const CustomButtonBlocConsumer({super.key, required this.isPaypal});

  final bool isPaypal;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) {
        if (state is PaymentSuccess) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return ThankYouView();
              },
            ),
          );
        }

        if (state is PaymentFailure) {
          Navigator.of(context).pop();
          SnackBar snackBar = SnackBar(content: Text(state.errMessage));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      builder: (context, state) {
        return CustomButton(
          isLoading: state is PaymentLoading ? true : false,
          onTap: () {
            if (isPaypal) {
              var transactionsData = getTransactionData();
              executePaypalPaymentMethod(context, transactionsData);
            } else {
              excuteStripePayment(context);
            }
          },
          text: 'Continue',
        );
      },
    );
  }

  void excuteStripePayment(BuildContext context) {
    PaymentIntentInputModel paymentIntentInputModel = PaymentIntentInputModel(
      amount: '52',
      currency: 'USD',
      customerId: 'cus_SmudXBjYk7E95Q',
    );
    BlocProvider.of<PaymentCubit>(
      context,
    ).makePayment(paymentIntentInputModel: paymentIntentInputModel);
  }

  void executePaypalPaymentMethod(
    BuildContext context,
    ({AmountModel amount, ItemListModel itemList}) transactionsData,
  ) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder:
            (BuildContext context) => PaypalCheckoutView(
              sandboxMode: true,
              clientId: ApiKeys.clientId,
              secretKey: ApiKeys.paypalSecretKey,
              transactions: [
                {
                  "amount": transactionsData.amount.toJson(),
                  "description": "The payment transaction description.",
                  "item_list": transactionsData.itemList.toJson(),
                },
              ],
              note: "Contact us for any questions on your order.",
              onSuccess: (Map params) async {
                log("onSuccess: $params");
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ThankYouView();
                    },
                  ),
                  (route) => false,
                );
              },
              onError: (error) {
                log("onError: $error");
                SnackBar snackBar = SnackBar(content: Text(error.toString()));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return MyCartView();
                    },
                  ),
                  (route) => false,
                );
              },
              onCancel: () {
                log('cancelled');
                Navigator.pop(context);
              },
            ),
      ),
    );
  }

  ({AmountModel amount, ItemListModel itemList}) getTransactionData() {
    var amount = AmountModel(
      total: '52',
      currency: 'USD',
      details: Details(subtotal: '43', shipping: '9', shippingDiscount: 0),
    );
    ItemListModel itemList = ItemListModel(
      items: [
        Item(
          name: 'Color Together Markers (24-pack)',
          quantity: 3,
          price: '5',
          currency: 'USD',
        ),
        Item(
          name: 'Dinoshapes Board Book',
          quantity: 2,
          price: '4',
          currency: 'USD',
        ),
        Item(
          name: 'Kinetic Sand Dino Dig Playset',
          quantity: 1,
          price: '20',
          currency: 'USD',
        ),
      ],
    );
    return (amount: amount, itemList: itemList);
  }
}
