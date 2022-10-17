class SearchModel {
  String? image;
  String? title;
  double? price;

  SearchModel({this.image, this.title, this.price});

  SearchModel.fromJson(Map<String, dynamic> json){
    image = json['image'];
    title = json['title'];
    price = json['price'].toDouble();
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'title': title,
      'price': price,
    };
  }
}
