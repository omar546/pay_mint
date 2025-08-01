import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pay_mint/Features/checkout/data/models/repo/checkout_repo.dart';

import '../../data/models/payment_intent_input_model.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit(this.checkoutRepo) : super(PaymentInitial());
  final CheckoutRepo checkoutRepo;

  Future makePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    var data = await checkoutRepo.makePayment(
      paymentIntentInputModel: paymentIntentInputModel,
    );
    data.fold(
      (L) => emit(PaymentFailure(L.errMessage)),
      (R) => emit(PaymentSuccess()),
    );
  }

  @override
  void onChange(Change<PaymentState> change) {
    super.onChange(change);
    log(change.toString());
  }
}
