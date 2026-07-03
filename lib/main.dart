import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'package:malina/pages/home_page/favs_page.dart' show FavoritesPage;
import 'package:malina/pages/home_page/home_page.dart';
import 'package:malina/pages/home_page/profile_page.dart';
import 'package:malina/pages/home_page/shopcart_page.dart';
import 'package:malina/services/cart_service.dart';
import 'package:malina/themes/themData.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
  );
  runApp(
    ChangeNotifierProvider(create: (_) => CartService(), child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Malina',
      theme: ThemeData(
        primaryColor: AppColors.primarycolor,
        scaffoldBackgroundColor: AppColors.backround1,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.white),
          headlineMedium: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.pinkAccent,
        ),
      ),
      home: const MyHomePage(title: 'Malina'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  void changeview(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [
          const HomePage(),
          const ProfilePage(),
          const FavoritesPage(),
          const ShoppingPage(),
        ],
      ),
      bottomNavigationBar: Consumer<CartService>(
        builder: (context, cartService, child) {
          return BottomNavigationBar(
            unselectedItemColor: Colors.grey,
            selectedItemColor: Colors.black,
            currentIndex: _currentIndex,
            onTap: (index) {
              changeview(index);
            },
            items: [
              const BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
              BottomNavigationBarItem(
                icon: Badge(
                  isLabelVisible: cartService.favorites.isNotEmpty,
                  label: Text('${cartService.favorites.length}'),
                  child: const Icon(Icons.favorite),
                ),
                label: 'Favorites',
              ),
              BottomNavigationBarItem(
                icon: Badge(
                  isLabelVisible: cartService.cart.isNotEmpty,
                  label: Text('${cartService.cartItemCount}'),
                  child: const Icon(Icons.shopping_cart),
                ),
                label: 'Basket',
              ),
            ],
          );
        },
      ),
    );
  }
}
