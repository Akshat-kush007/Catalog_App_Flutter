import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../models/product_data.dart';

class ProductUI extends StatelessWidget {
  final Product product;

  ProductUI({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.network(
          product.image,
          fit: BoxFit.contain,
          height: 100,
          width: 40,
        ),
        title: Text(product.name),
        subtitle: Text(product.desc),
        trailing: Text(
          "\$${product.price.toString()}",
          textScaleFactor: 1.2,
          style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
