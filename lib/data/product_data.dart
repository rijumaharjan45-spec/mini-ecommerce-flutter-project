import 'package:flutter/material.dart';

import '../models/product.dart';

// Placeholder images from picsum.photos (needs internet).
String _img(String seed) => 'https://picsum.photos/seed/$seed/600/600';

const List<Category> categories = [
  Category(name: 'Electronics', icon: Icons.devices),
  Category(name: 'Fashion', icon: Icons.checkroom),
  Category(name: 'Shoes', icon: Icons.directions_run),
  Category(name: 'Beauty', icon: Icons.face_retouching_natural),
  Category(name: 'Accessories', icon: Icons.watch),
  Category(name: 'Home', icon: Icons.home_outlined),
];

final List<PromoBanner> banners = [
  PromoBanner(
    title: 'Summer Sale',
    subtitle: 'Up to 50% off on fashion',
    image: 'https://picsum.photos/seed/summersale/1000/500',
    targetCategory: 'Fashion',
  ),
  PromoBanner(
    title: 'New Arrivals',
    subtitle: 'Fresh sneakers just landed',
    image: 'https://picsum.photos/seed/newarrivals/1000/500',
    targetCategory: 'Shoes',
  ),
  PromoBanner(
    title: 'Electronics Discount',
    subtitle: 'Gadgets from Rs. 999',
    image: 'https://picsum.photos/seed/electronicsdeal/1000/500',
    targetCategory: 'Electronics',
  ),
];

final List<Product> products = [
  // Electronics
  Product(
    name: 'Wireless Headphones',
    category: 'Electronics',
    image: _img('headphones'),
    price: 3500,
    rating: 4.5,
    description:
    'Wireless Bluetooth headphones with high-quality sound, deep bass and up to 30 hours of battery life.',
    discountPercent: 20,
    isNew: true,
  ),
  Product(
    name: 'Smart Watch',
    category: 'Electronics',
    image: _img('smartwatch'),
    price: 4999,
    rating: 4.3,
    description:
    'Fitness tracking, heart-rate monitor, sleep tracking and phone notifications on your wrist.',
  ),
  Product(
    name: 'Laptop Pro 14',
    category: 'Electronics',
    image: _img('laptop'),
    price: 74999,
    rating: 4.7,
    description:
    'Lightweight 14-inch laptop with a fast processor, 16 GB RAM and a 512 GB SSD for study and work.',
    discountPercent: 10,
  ),
  // Fashion
  Product(
    name: 'Cotton T-Shirt',
    category: 'Fashion',
    image: _img('tshirt'),
    price: 899,
    rating: 4.2,
    description:
    'Soft, breathable 100% cotton t-shirt with a relaxed fit. Perfect for everyday wear.',
    discountPercent: 50,
  ),
  Product(
    name: 'Denim Jacket',
    category: 'Fashion',
    image: _img('denimjacket'),
    price: 3200,
    rating: 4.4,
    description:
    'Classic denim jacket with button front and two chest pockets. Goes with almost everything.',
    isNew: true,
  ),
  Product(
    name: 'Summer Dress',
    category: 'Fashion',
    image: _img('summerdress'),
    price: 2400,
    rating: 4.6,
    description:
    'Light floral dress made from breathable fabric, ideal for warm weather.',
    discountPercent: 30,
  ),
  // Shoes
  Product(
    name: 'Running Sneakers',
    category: 'Shoes',
    image: _img('sneakers'),
    price: 3999,
    rating: 4.8,
    description:
    'Cushioned running sneakers with a grippy sole and breathable mesh upper.',
    isNew: true,
  ),
  Product(
    name: 'Leather Loafers',
    category: 'Shoes',
    image: _img('loafers'),
    price: 4500,
    rating: 4.1,
    description:
    'Comfortable genuine-leather loafers for office and formal occasions.',
  ),
  Product(
    name: 'Canvas Shoes',
    category: 'Shoes',
    image: _img('canvasshoes'),
    price: 1800,
    rating: 4.0,
    description: 'Casual canvas shoes with a flexible rubber sole.',
    discountPercent: 15,
  ),
  // Beauty
  Product(
    name: 'Moisturizing Face Cream',
    category: 'Beauty',
    image: _img('facecream'),
    price: 1200,
    rating: 4.4,
    description:
    'Daily face cream with aloe and vitamin E to keep skin soft and hydrated.',
  ),
  Product(
    name: 'Lipstick Set',
    category: 'Beauty',
    image: _img('lipstick'),
    price: 1500,
    rating: 4.5,
    description: 'Set of 4 long-lasting matte lipsticks in popular shades.',
    discountPercent: 25,
    isNew: true,
  ),
  Product(
    name: 'Eau de Parfum',
    category: 'Beauty',
    image: _img('perfume'),
    price: 3500,
    rating: 4.6,
    description: 'A fresh floral and woody fragrance that lasts all day.',
  ),
  // Accessories
  Product(
    name: 'Sunglasses',
    category: 'Accessories',
    image: _img('sunglasses'),
    price: 1500,
    rating: 4.3,
    description: 'UV-protected polarized sunglasses with a lightweight frame.',
    discountPercent: 20,
  ),
  Product(
    name: 'Travel Backpack',
    category: 'Accessories',
    image: _img('backpack'),
    price: 2800,
    rating: 4.7,
    description:
    'Water-resistant 25L backpack with a padded laptop sleeve and multiple pockets.',
    isNew: true,
  ),
  Product(
    name: 'Leather Wallet',
    category: 'Accessories',
    image: _img('wallet'),
    price: 950,
    rating: 4.2,
    description: 'Slim leather wallet with 6 card slots and a coin pocket.',
  ),
  // Home
  Product(
    name: 'Table Lamp',
    category: 'Home',
    image: _img('tablelamp'),
    price: 1800,
    rating: 4.5,
    description: 'Modern table lamp with warm light, great for bedside or desk.',
  ),
  Product(
    name: 'Ceramic Vase',
    category: 'Home',
    image: _img('vase'),
    price: 1100,
    rating: 4.1,
    description: 'Handmade ceramic vase that adds a touch of style to any room.',
    discountPercent: 10,
  ),
  Product(
    name: 'Cushion Cover Set',
    category: 'Home',
    image: _img('cushions'),
    price: 1600,
    rating: 4.4,
    description: 'Set of 3 soft cushion covers in matching colours.',
    isNew: true,
  ),
];