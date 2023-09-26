import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../data/products.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CachedNetworkImage(
          imageUrl: product.imageUrl,
          placeholder: (context, url) => const CircularProgressIndicator(),
          errorWidget: (context, url, error) => const Icon(Icons.error),
          height: 40,
          width: 40,
        ),
        title: Text(product.name),
        trailing: Text('R\$ ${product.price}'),
      ),
    );
  }
}
