import 'package:flutter/widgets.dart';

/// Formats 3500 -> "Rs. 3,500"
String formatPrice(double value) {
  final digits = value.toStringAsFixed(0);
  final buffer = StringBuffer();
  for (int i = 0; i < digits.length; i++) {
    if (i > 0 && (digits.length - i) % 3 == 0) buffer.write(',');
    buffer.write(digits[i]);
  }
  return 'Rs. $buffer';
}

class Product {
  final String name;
  final String category;
  final String image;
  final double price;
  final double rating;
  final String description;
  final int discountPercent; // 0 means no discount badge
  final bool isNew;

  const Product({
    required this.name,
    required this.category,
    required this.image,
    required this.price,
    required this.rating,
    required this.description,
    this.discountPercent = 0,
    this.isNew = false,
  });

  String get priceText => formatPrice(price);
}

class Category {
  final String name;
  final IconData icon;

  const Category({required this.name, required this.icon});
}

class PromoBanner {
  final String title;
  final String subtitle;
  final String image;

  /// The "link" of the banner: tapping it opens this category.
  final String targetCategory;

  const PromoBanner({
    required this.title,
    required this.subtitle,
    required this.image,
    required this.targetCategory,
  });
}