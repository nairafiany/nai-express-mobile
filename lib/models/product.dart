// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

List<Product> productFromJson(String str) =>
    List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
  String model;
  String pk;
  Fields fields;

  Product({
    required this.model,
    required this.pk,
    required this.fields,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
      );

  Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
      };
}

class Fields {
  int user;
  String name;
  String description;
  String price;
  int stock;
  String image;
  String availability;
  String discount;

  Fields({
    required this.user,
    required this.name,
    required this.description,
    required this.price,
    required this.stock,
    required this.image,
    required this.availability,
    required this.discount,
  });

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        name: json["name"],
        description: json["description"],
        price: json["price"],
        stock: json["stock"],
        image: json["image"],
        availability: json["availability"],
        discount: json["discount"],
      );

  Map<String, dynamic> toJson() => {
        "user": user,
        "name": name,
        "description": description,
        "price": price,
        "stock": stock,
        "image": image,
        "availability": availability,
        "discount": discount,
      };
}
