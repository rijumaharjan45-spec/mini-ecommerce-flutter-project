import 'package:flutter/material.dart';

import '../models/product.dart';
import 'app_image.dart';

/// Reusable product card. Used on the Home page (horizontal list)
/// and on the Category page (GridView).
class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback onTap;

  const ProductCard({super.key, required this.product, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Image area: Stack puts badges + favourite icon on top of the image
            Expanded(
              child: Stack(
                children: [
                  Positioned.fill(child: AppImage(url: product.image)),
                  Positioned(
                    top: 8,
                    left: 8,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (product.discountPercent > 0)
                          _Badge(
                            text: '-${product.discountPercent}%',
                            color: Colors.red.shade700,
                          ),
                        if (product.isNew) ...[
                          const SizedBox(height: 4),
                          _Badge(text: 'New', color: Colors.green.shade700),
                        ],
                      ],
                    ),
                  ),
                  const Positioned(top: 6, right: 6, child: _FavoriteButton()),
                ],
              ),
            ),
            // Info area
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 8, 10, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    product.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.titleSmall
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          product.priceText,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: theme.colorScheme.primary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const Icon(Icons.star, size: 16, color: Colors.amber),
                      const SizedBox(width: 2),
                      Text('${product.rating}',
                          style: theme.textTheme.bodySmall),
                    ],
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 34,
                    child: ElevatedButton(
                      onPressed: onTap, // navigates to Product Details
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text('View Details'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  final String text;
  final Color color;

  const _Badge({required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 11,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class _FavoriteButton extends StatefulWidget {
  const _FavoriteButton();

  @override
  State<_FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<_FavoriteButton> {
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      shape: const CircleBorder(),
      elevation: 1,
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: () => setState(() => _isFavorite = !_isFavorite),
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Icon(
            _isFavorite ? Icons.favorite : Icons.favorite_border,
            size: 18,
            color: _isFavorite ? Colors.red : Colors.grey.shade700,
          ),
        ),
      ),
    );
  }
}