import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pay_mint/Features/checkout/presentation/views/thank_you_view.dart';

import '../../../data/models/payment_intent_input_model.dart';
import '../../manager/payment_cubit.dart';
import 'custom_button.dart';

class CustomButtonBlocConsumer extends StatelessWidget {
  const CustomButtonBlocConsumer({super.key});

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
            PaymentIntentInputModel paymentIntentInputModel =
                PaymentIntentInputModel(
                  amount: '52',
                  currency: 'USD',
                  customerId: 'cus_SmudXBjYk7E95Q',
                );
            BlocProvider.of<PaymentCubit>(
              context,
            ).makePayment(paymentIntentInputModel: paymentIntentInputModel);
          },
          text: 'Continue',
        );
      },
    );
  }
}
