import 'dart:convert';
import 'package:flutter/services.dart';

class Product {
  final int id;
  final String name;
  final String desc;
  final double price;
  final String color;
  final String image;

  Product({
    required this.id,
    required this.name,
    required this.desc,
    required this.price,
    required this.color,
    required this.image,
  });
}

class ProductData {
  List<Product> _productList = [];

  Future featchAndSetProductData() async {
    try {
      // await Future.delayed(Duration(seconds: 5));
      final json = await rootBundle.loadString('assets/files/catalog.json');
      final decodedJson = jsonDecode(json);
      _productList = decodedJson['products'].map<Product>((item) {
        // print(item);
        return Product(
          id: item["id"],
          name: item["name"],
          desc: item["desc"],
          price: item["price"].toDouble(),
          color: item["color"],
          image: item["image"],
        );
      }).toList();
    } catch (error) {
      print('Error in Decoding JSON ');
      print(error);
    }
  }

  Future get productData async {
    if (_productList.isEmpty) await featchAndSetProductData();
    //
    return _productList;
  }
}
