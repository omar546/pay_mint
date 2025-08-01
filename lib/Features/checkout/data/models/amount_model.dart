class AmountModel {
  AmountModel({
    required this.total,
    required this.currency,
    required this.details,
  });

  final String? total;
  final String? currency;
  final Details? details;

  factory AmountModel.fromJson(Map<String, dynamic> json) {
    return AmountModel(
      total: json["total"],
      currency: json["currency"],
      details:
          json["details"] == null ? null : Details.fromJson(json["details"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "total": total,
    "currency": currency,
    "details": details?.toJson(),
  };
}

class Details {
  Details({
    required this.subtotal,
    required this.shipping,
    required this.shippingDiscount,
  });

  final String? subtotal;
  final String? shipping;
  final num? shippingDiscount;

  factory Details.fromJson(Map<String, dynamic> json) {
    return Details(
      subtotal: json["subtotal"],
      shipping: json["shipping"],
      shippingDiscount: json["shipping_discount"],
    );
  }

  Map<String, dynamic> toJson() => {
    "subtotal": subtotal,
    "shipping": shipping,
    "shipping_discount": shippingDiscount,
  };
}
