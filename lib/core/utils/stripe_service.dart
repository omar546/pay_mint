import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:pay_mint/Features/checkout/data/models/ephemeral_key_model.dart';
import 'package:pay_mint/Features/checkout/data/models/payment_intent_model.dart';
import 'package:pay_mint/core/utils/api_key.dart';

import '../../Features/checkout/data/models/init_payment_sheet_input_model.dart';
import '../../Features/checkout/data/models/payment_intent_input_model.dart';
import 'api_service.dart';

class StripeService {
  final ApiService apiService = ApiService();

  Future<PaymentIntentModel> createPaymentIntent(
    PaymentIntentInputModel paymentIntentInputModel,
  ) async {
    var response = await apiService.post(
      contentType: Headers.formUrlEncodedContentType,
      body: paymentIntentInputModel.toJson(),
      url: 'https://api.stripe.com/v1/payment_intents',
      token: ApiKeys.secretkey,
    );
    var paymentIntentModel = PaymentIntentModel.fromJson(response.data);
    return paymentIntentModel;
  }

  Future initPaymentSheet({
    required InitPaymentSheetInputModel initPaymentSheetInputModel,
  }) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: initPaymentSheetInputModel.clientSecret,
        customerEphemeralKeySecret:
            initPaymentSheetInputModel.ephemeralKeySecret,
        customerId: initPaymentSheetInputModel.customerId,
        merchantDisplayName: 'PayMint',
      ),
    );
  }

  Future displayPaymentSheet() async => Stripe.instance.presentPaymentSheet();

  Future makePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    var paymentIntent = await createPaymentIntent(paymentIntentInputModel);
    var ephemeralKeyModel = await createEphemeralKey(
      customerId: paymentIntentInputModel.customerId,
    );
    var initPaymentSheetInputModel = InitPaymentSheetInputModel(
      clientSecret: paymentIntent.clientSecret!,
      customerId: paymentIntentInputModel.customerId,
      ephemeralKeySecret: ephemeralKeyModel.secret!,
    );
    await initPaymentSheet(
      initPaymentSheetInputModel: initPaymentSheetInputModel,
    );
    await displayPaymentSheet();
  }

  Future<EphemeralKeyModel> createEphemeralKey({
    required String customerId,
  }) async {
    var response = await apiService.post(
      contentType: Headers.formUrlEncodedContentType,
      headers: {
        'Authorization': 'Bearer ${ApiKeys.secretkey}',
        'Stripe-Version': '2025-07-30.basil',
      },
      body: {'customer': customerId},
      url: 'https://api.stripe.com/v1/ephemeral_keys',
      token: ApiKeys.secretkey,
    );
    var ephemeralKeyModel = EphemeralKeyModel.fromJson(response.data);
    return ephemeralKeyModel;
  }
}
