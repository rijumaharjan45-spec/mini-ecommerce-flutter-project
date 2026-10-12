import 'package:flutter/material.dart';

import '../models/product.dart';
import '../widgets/app_image.dart';

class ProductDetailsPage extends StatelessWidget {
  final Product product;

  const ProductDetailsPage({super.key, required this.product});

  Widget _buildStars() {
    return Row(
      children: [
        ...List.generate(5, (i) {
          IconData icon;
          if (product.rating >= i + 1) {
            icon = Icons.star;
          } else if (product.rating >= i + 0.5) {
            icon = Icons.star_half;
          } else {
            icon = Icons.star_border;
          }
          return Icon(icon, color: Colors.amber, size: 22);
        }),
        const SizedBox(width: 8),
        Text('${product.rating}',
            style: const TextStyle(fontWeight: FontWeight.w600)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Product Details')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product image
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: AspectRatio(
                aspectRatio: 1,
                child: AppImage(url: product.image),
              ),
            ),
            const SizedBox(height: 16),

            // Name
            Text(
              product.name,
              style: theme.textTheme.headlineSmall
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            // Category chip
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: theme.colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                product.category,
                style: TextStyle(
                  color: theme.colorScheme.onPrimaryContainer,
                  fontSize: 12,
                ),
              ),
            ),
            const SizedBox(height: 12),

            // Rating
            _buildStars(),
            const SizedBox(height: 12),

            // Price (+ discount badge)
            Row(
              children: [
                Text(
                  product.priceText,
                  style: theme.textTheme.headlineSmall?.copyWith(
                    color: theme.colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (product.discountPercent > 0) ...[
                  const SizedBox(width: 10),
                  Container(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      color: Colors.red.shade700,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      '-${product.discountPercent}%',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ],
            ),
            const Divider(height: 32),

            // Description
            Text(
              'Description',
              style: theme.textTheme.titleMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(product.description, style: theme.textTheme.bodyLarge),
          ],
        ),
      ),

      // Add to Cart button stays at the bottom
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
            height: 50,
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context)
                  ..clearSnackBars()
                  ..showSnackBar(
                    const SnackBar(content: Text('Product added to cart')),
                  );
              },
              icon: const Icon(Icons.add_shopping_cart),
              label: const Text('Add to Cart'),
            ),
          ),
        ),
      ),
    );
  }
}