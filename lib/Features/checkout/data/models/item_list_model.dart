class ItemListModel {
  ItemListModel({required this.items});

  final List<Item> items;

  factory ItemListModel.fromJson(Map<String, dynamic> json) {
    return ItemListModel(
      items:
          json["items"] == null
              ? []
              : List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "items": items.map((x) => x.toJson()).toList(),
  };
}

class Item {
  Item({
    required this.name,
    required this.quantity,
    required this.price,
    required this.currency,
  });

  final String? name;
  final int? quantity;
  final String? price;
  final String? currency;

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      name: json["name"],
      quantity: json["quantity"],
      price: json["price"],
      currency: json["currency"],
    );
  }

  Map<String, dynamic> toJson() => {
    "name": name,
    "quantity": quantity,
    "price": price,
    "currency": currency,
  };
}
