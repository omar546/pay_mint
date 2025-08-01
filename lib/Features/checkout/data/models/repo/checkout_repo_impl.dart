import 'package:dartz/dartz.dart';
import 'package:pay_mint/Features/checkout/data/models/repo/checkout_repo.dart';

import '../../../../../core/errors/failures.dart';
import '../../../../../core/utils/stripe_service.dart';
import '../payment_intent_input_model.dart';

class CheckoutRepoImpl extends CheckoutRepo {
  final StripeService stripeService = StripeService();

  @override
  Future<Either<Failure, void>> makePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    try {
      await stripeService.makePayment(
        paymentIntentInputModel: paymentIntentInputModel,
      );
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(errMessage: e.toString()));
    }
  }
}
