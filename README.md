# MyShop – Mini E-Commerce App (Flutter)

**Student Name:** Riju Maharjan
**Student ID:** 2510412199
**Course:** Mobile Application Development – Flutter
**Assignment:** Practical Assignment – Mini E-Commerce Application

## Description

MyShop is a simple multi-screen shopping app built with Flutter. Users can browse
promotional banners, scroll through product categories, open a category page that
lists its products in a grid, and view the full details of any product.
The app uses static/local product data (no backend, login or payment).

## Features

- Home page with AppBar (logo, search icon, cart icon)
- Auto-playing promotional banner carousel (3 banners, tappable)
- Horizontally scrolling category list
- "Popular Products" section with "See All"
- Reusable `ProductCard` (Card + Container + Stack with discount/new badges and favourite icon)
- Category page using `GridView.builder`, filtered by the selected category
- Product details page (image, name, category, rating, price, description)
- "Add to Cart" button showing a `SnackBar`
- 6 categories and 18 products

## Packages Used

| Package | Purpose |
|---|---|
| [carousel_slider](https://pub.dev/packages/carousel_slider) (^5.1.2) | Creates the auto-playing promotional banner carousel on the home page |

## Project Structure