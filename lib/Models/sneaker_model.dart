import 'dart:convert';

Sneakers sneakersFromJson(String str) => Sneakers.fromJson(json.decode(str));


class Sneakers {
  final String id;
  final String name;
  final String category;
  final List<String> imageurl;
  final String oldPrice;
  final List<dynamic> sizes;
  final String price;
  final String description;
  final String title;

  Sneakers({
    required this.id,
    required this.name,
    required this.category,
    required this.imageurl,
    required this.oldPrice,
    required this.sizes,
    required this.price,
    required this.description,
    required this.title,
  });

  factory Sneakers.fromJson(Map<String, dynamic> json) => Sneakers(
    id: json["id"],
    name: json["name"],
    category: json["category"],
    imageurl: List<String>.from(json["imageurl"].map((x) => x)),
    oldPrice: json["oldPrice"],
    sizes: List<dynamic>.from(json["sizes"].map((x) => x)),
    price: json["price"],
    description: json["description"],
    title: json["title"],
  );


}

