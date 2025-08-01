class PaymentIntentModel {
  PaymentIntentModel({
    required this.id,
    required this.object,
    required this.amount,
    required this.amountCapturable,
    required this.amountDetails,
    required this.amountReceived,
    required this.application,
    required this.applicationFeeAmount,
    required this.automaticPaymentMethods,
    required this.canceledAt,
    required this.cancellationReason,
    required this.captureMethod,
    required this.clientSecret,
    required this.confirmationMethod,
    required this.created,
    required this.currency,
    required this.customer,
    required this.description,
    required this.lastPaymentError,
    required this.latestCharge,
    required this.livemode,
    required this.metadata,
    required this.nextAction,
    required this.onBehalfOf,
    required this.paymentMethod,
    required this.paymentMethodOptions,
    required this.paymentMethodTypes,
    required this.processing,
    required this.receiptEmail,
    required this.review,
    required this.setupFutureUsage,
    required this.shipping,
    required this.source,
    required this.statementDescriptor,
    required this.statementDescriptorSuffix,
    required this.status,
    required this.transferData,
    required this.transferGroup,
  });

  final String? id;
  final String? object;
  final int? amount;
  final int? amountCapturable;
  final AmountDetails? amountDetails;
  final int? amountReceived;
  final dynamic application;
  final dynamic applicationFeeAmount;
  final AutomaticPaymentMethods? automaticPaymentMethods;
  final dynamic canceledAt;
  final dynamic cancellationReason;
  final String? captureMethod;
  final String? clientSecret;
  final String? confirmationMethod;
  final int? created;
  final String? currency;
  final dynamic customer;
  final dynamic description;
  final dynamic lastPaymentError;
  final dynamic latestCharge;
  final bool? livemode;
  final Metadata? metadata;
  final dynamic nextAction;
  final dynamic onBehalfOf;
  final dynamic paymentMethod;
  final PaymentMethodOptions? paymentMethodOptions;
  final List<String> paymentMethodTypes;
  final dynamic processing;
  final dynamic receiptEmail;
  final dynamic review;
  final dynamic setupFutureUsage;
  final dynamic shipping;
  final dynamic source;
  final dynamic statementDescriptor;
  final dynamic statementDescriptorSuffix;
  final String? status;
  final dynamic transferData;
  final dynamic transferGroup;

  factory PaymentIntentModel.fromJson(Map<String, dynamic> json) {
    return PaymentIntentModel(
      id: json["id"],
      object: json["object"],
      amount: json["amount"],
      amountCapturable: json["amount_capturable"],
      amountDetails:
          json["amount_details"] == null
              ? null
              : AmountDetails.fromJson(json["amount_details"]),
      amountReceived: json["amount_received"],
      application: json["application"],
      applicationFeeAmount: json["application_fee_amount"],
      automaticPaymentMethods:
          json["automatic_payment_methods"] == null
              ? null
              : AutomaticPaymentMethods.fromJson(
                json["automatic_payment_methods"],
              ),
      canceledAt: json["canceled_at"],
      cancellationReason: json["cancellation_reason"],
      captureMethod: json["capture_method"],
      clientSecret: json["client_secret"],
      confirmationMethod: json["confirmation_method"],
      created: json["created"],
      currency: json["currency"],
      customer: json["customer"],
      description: json["description"],
      lastPaymentError: json["last_payment_error"],
      latestCharge: json["latest_charge"],
      livemode: json["livemode"],
      metadata:
          json["metadata"] == null ? null : Metadata.fromJson(json["metadata"]),
      nextAction: json["next_action"],
      onBehalfOf: json["on_behalf_of"],
      paymentMethod: json["payment_method"],
      paymentMethodOptions:
          json["payment_method_options"] == null
              ? null
              : PaymentMethodOptions.fromJson(json["payment_method_options"]),
      paymentMethodTypes:
          json["payment_method_types"] == null
              ? []
              : List<String>.from(json["payment_method_types"]!.map((x) => x)),
      processing: json["processing"],
      receiptEmail: json["receipt_email"],
      review: json["review"],
      setupFutureUsage: json["setup_future_usage"],
      shipping: json["shipping"],
      source: json["source"],
      statementDescriptor: json["statement_descriptor"],
      statementDescriptorSuffix: json["statement_descriptor_suffix"],
      status: json["status"],
      transferData: json["transfer_data"],
      transferGroup: json["transfer_group"],
    );
  }
}

class AmountDetails {
  AmountDetails({required this.tip});

  final Metadata? tip;

  factory AmountDetails.fromJson(Map<String, dynamic> json) {
    return AmountDetails(
      tip: json["tip"] == null ? null : Metadata.fromJson(json["tip"]),
    );
  }
}

class Metadata {
  Metadata({required this.json});
  final Map<String, dynamic> json;

  factory Metadata.fromJson(Map<String, dynamic> json) {
    return Metadata(json: json);
  }
}

class AutomaticPaymentMethods {
  AutomaticPaymentMethods({required this.enabled});

  final bool? enabled;

  factory AutomaticPaymentMethods.fromJson(Map<String, dynamic> json) {
    return AutomaticPaymentMethods(enabled: json["enabled"]);
  }
}

class PaymentMethodOptions {
  PaymentMethodOptions({required this.card, required this.link});

  final Card? card;
  final Link? link;

  factory PaymentMethodOptions.fromJson(Map<String, dynamic> json) {
    return PaymentMethodOptions(
      card: json["card"] == null ? null : Card.fromJson(json["card"]),
      link: json["link"] == null ? null : Link.fromJson(json["link"]),
    );
  }
}

class Card {
  Card({
    required this.installments,
    required this.mandateOptions,
    required this.network,
    required this.requestThreeDSecure,
  });

  final dynamic installments;
  final dynamic mandateOptions;
  final dynamic network;
  final String? requestThreeDSecure;

  factory Card.fromJson(Map<String, dynamic> json) {
    return Card(
      installments: json["installments"],
      mandateOptions: json["mandate_options"],
      network: json["network"],
      requestThreeDSecure: json["request_three_d_secure"],
    );
  }
}

class Link {
  Link({required this.persistentToken});

  final dynamic persistentToken;

  factory Link.fromJson(Map<String, dynamic> json) {
    return Link(persistentToken: json["persistent_token"]);
  }
}
