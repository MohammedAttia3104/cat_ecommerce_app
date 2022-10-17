class CartProductModel {
  String? image;
  String? title;
  double? price;
  int? quantity;

  CartProductModel({this.image, this.title, this.price, this.quantity});

   CartProductModel.fromJson(Map<dynamic, dynamic> json) {
     image = json['image'];
     title = json['title'];
     price = json['price'] == null ? 0.0 : json['price'].toDouble();
     quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image'] = image;
    data['title'] = title;
    data['price'] = price;
    data['quantity'] = quantity;
    return data;
  }
}
