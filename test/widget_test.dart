import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:malina/main.dart';
import 'package:malina/services/cart_service.dart';

void main() {
  testWidgets('App loads with products', (WidgetTester tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => CartService(),
        child: const MyApp(),
      ),
    );

    // Verify app loads
    expect(find.byType(MaterialApp), findsOneWidget);

    // Verify products are displayed
    expect(find.text('Товар 1'), findsOneWidget);
    expect(find.text('Товар 2'), findsOneWidget);
  });

  testWidgets('Add to cart functionality', (WidgetTester tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => CartService(),
        child: const MyApp(),
      ),
    );

    // Tap "Add to cart" button
    final addToCartButton = find.byIcon(Icons.shopping_cart).first;
    await tester.tap(addToCartButton);
    await tester.pump();

    // Verify snackbar appears
    expect(find.text('Товар 1 добавлен в корзину'), findsOneWidget);
  });

  testWidgets('Add to favorites functionality', (WidgetTester tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => CartService(),
        child: const MyApp(),
      ),
    );

    // Tap favorite button
    final favoriteButton = find.byIcon(Icons.favorite_border).first;
    await tester.tap(favoriteButton);
    await tester.pump();

    // Verify badge appears on favorites tab
    expect(find.text('1'), findsOneWidget);
  });
}
