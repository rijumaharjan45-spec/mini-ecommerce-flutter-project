import 'package:flutter/material.dart';

import '../data/product_data.dart';
import '../widgets/banner_carousel.dart';
import '../widgets/category_item.dart';
import '../widgets/product_card.dart';
import 'category_page.dart';
import 'product_details_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _openCategory(BuildContext context, String name) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CategoryPage(categoryName: name),
      ),
    );
  }

  void _showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
      ..clearSnackBars()
      ..showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    final popularProducts = products.take(8).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.shopping_bag_outlined),
            SizedBox(width: 8),
            Text('MyShop', style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => _showMessage(context, 'Search coming soon'),
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined),
            onPressed: () => _showMessage(context, 'Your cart is empty'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),

            // 1. Banner carousel (carousel_slider package)
            BannerCarousel(
              banners: banners,
              onBannerTap: (banner) =>
                  _openCategory(context, banner.targetCategory),
            ),

            // 2. Horizontal category list
            const _SectionTitle(title: 'Shop by Category'),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: categories
                    .map(
                      (c) => CategoryItem(
                    category: c,
                    onTap: () => _openCategory(context, c.name),
                  ),
                )
                    .toList(),
              ),
            ),

            // 3. Popular products
            _SectionTitle(
              title: 'Popular Products',
              actionText: 'See All →',
              onAction: () => _openCategory(context, 'All'),
            ),
            SizedBox(
              height: 300,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                itemCount: popularProducts.length,
                itemBuilder: (context, index) {
                  final product = popularProducts[index];
                  return SizedBox(
                    width: 176,
                    child: ProductCard(
                      product: product,
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ProductDetailsPage(product: product),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;
  final String? actionText;
  final VoidCallback? onAction;

  const _SectionTitle({required this.title, this.actionText, this.onAction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 8, 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          if (actionText != null)
            TextButton(onPressed: onAction, child: Text(actionText!)),
        ],
      ),
    );
  }
}