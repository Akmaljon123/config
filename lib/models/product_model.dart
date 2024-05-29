import 'dart:convert';

List<ProductModel> productModelFromJson(String str) => List<ProductModel>.from(json.decode(str).map((x) => ProductModel.fromJson(x)));


class ProductModel {
  String? name;
  double? price;
  String? ram;
  String? storage;
  String? videoCard;
  String? imageUrl;

  ProductModel({
    this.name,
    this.price,
    this.ram,
    this.storage,
    this.videoCard,
    this.imageUrl
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    name: json["name"],
    price: json["price"]?.toDouble(),
    ram: json["RAM"],
    storage: json["storage"],
    videoCard: json["videoCard"],
    imageUrl: json["imageUrl"]
  );

}





