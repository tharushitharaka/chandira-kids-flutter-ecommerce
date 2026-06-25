import 'package:flutter/material.dart';
import '../../models/product.dart';

/// Product Details Screen - Coming Soon
class ProductDetailsScreen extends StatelessWidget {
  final Product product;

  const ProductDetailsScreen({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
        backgroundColor: const Color(0xFFFF69B4),
      ),
      body: Center(
        child: Text('Product Details for ${product.name} - Coming Soon'),
      ),
    );
  }
}
