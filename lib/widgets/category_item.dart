import 'package:flutter/material.dart';

import '../models/product.dart';

/// One round category icon + label, used in the horizontal category list.
class CategoryItem extends StatelessWidget {
  final Category category;
  final VoidCallback onTap;

  const CategoryItem({super.key, required this.category, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: SizedBox(
        width: 76,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 28,
              backgroundColor: scheme.primaryContainer,
              child: Icon(category.icon, color: scheme.onPrimaryContainer),
            ),
            const SizedBox(height: 6),
            Text(
              category.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}