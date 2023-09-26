import 'package:cardapio_digital/data/products.dart'; // Importe seus produtos aqui
import 'package:flutter/material.dart';

import '../widgets/product_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<String> categories = [
    "Bebidas",
    "Porções",
    "Destilados",
    "Outros"
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: categories.length,
      initialIndex: _currentIndex,
      child: Scaffold(
        appBar: AppBar(
          title: Text(categories[_currentIndex]),
          bottom: TabBar(
            tabs: categories.map((category) => Tab(text: category)).toList(),
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
        body: TabBarView(
          children: categories.map((category) {
            final filteredProducts = products
                .where((product) => product.category == category)
                .toList();

            return ListView.builder(
              itemCount: filteredProducts.length,
              itemBuilder: (context, index) {
                return ProductCard(product: filteredProducts[index]);
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}
