import 'package:flutter/material.dart';

import '../data/product_data.dart';
import '../widgets/product_card.dart';
import 'product_details_page.dart';

class CategoryPage extends StatelessWidget {
  /// Received from the Home page. "All" shows every product.
  final String categoryName;

  const CategoryPage({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    // Filter products according to the selected category
    final filtered = categoryName == 'All'
        ? products
        : products.where((p) => p.category == categoryName).toList();

    return Scaffold(
      appBar: AppBar(title: Text(categoryName)),
      body: filtered.isEmpty
          ? const Center(child: Text('No products found in this category'))
          : Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '${filtered.length} products',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: filtered.length,
              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 0.64,
              ),
              itemBuilder: (context, index) {
                final product = filtered[index];
                return ProductCard(
                  product: product,
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ProductDetailsPage(product: product),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}