import 'dart:convert';
import 'package:http/http.dart' as http;

class Product{
  final int id;
  final String nom;
  final String description;
  final double prix;
  final String image;
  final String categorie;
  final double note;

  Product(
      {
        required this.id,
        required this.nom,
        required this.description,
        required this.prix,
        required this.image,
        required this.categorie,
        required this.note
      });

  factory Product.fromMap(Map<String, dynamic> json) => Product(
    id: int.parse(json['id'].toString()).toInt(),
    nom: json['title'],
    description: json['description'],
    prix: double.parse(json['price'].toString()).toDouble(),
    image: json['image'],
    categorie: json['category'],
    note: double.parse(json['rating']['rate'].toString()).toDouble()
  );

  String displayPriceInEuro() => "$prix €";
}