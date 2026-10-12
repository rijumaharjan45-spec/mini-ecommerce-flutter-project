import 'package:flutter_test/flutter_test.dart';

import 'package:myshop/main.dart';

void main() {
  testWidgets('MyShop home page loads', (WidgetTester tester) async {
    await tester.pumpWidget(const MyShopApp());
    expect(find.text('MyShop'), findsOneWidget);
  });
}