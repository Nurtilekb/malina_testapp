import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:malina/pages/auth/login_page.dart';
import 'package:malina/pages/home/favs_page.dart';
import 'package:provider/provider.dart';

import 'package:malina/pages/home/home_page.dart';
import 'package:malina/pages/home/profile_page.dart';
import 'package:malina/pages/home/basket_page.dart';
import 'package:malina/services/cart_service.dart';
import 'package:malina/core/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
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
        primaryColor: AppColors.iosBlue,
        scaffoldBackgroundColor: AppColors.backround2,
        fontFamily: '.SF Pro Display',
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          foregroundColor: AppColors.textcolor2,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
            color: AppColors.textcolor2,
          ),
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: AppColors.textcolor2, fontSize: 15),
          bodyLarge: TextStyle(color: AppColors.textcolor2, fontSize: 17),
          headlineMedium: TextStyle(
            color: AppColors.textcolor2,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
          titleLarge: TextStyle(
            color: AppColors.textcolor2,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.iosBlue,
            foregroundColor: Colors.white,
            elevation: 0,
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppRadius.md),
            ),
            textStyle: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: AppColors.backround2,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppRadius.md),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
        ),
        dividerTheme: const DividerThemeData(
          color: AppColors.bordercolor,
          thickness: 0.5,
          space: 0.5,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: AppColors.iosBlue,
          foregroundColor: Colors.white,
          elevation: 0,
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
      extendBody: true,
      backgroundColor: AppColors.backround2,
      body: IndexedStack(
        index: _currentIndex,
        children: const [
          HomePage(),
          ProfilePage(),
          FavoritesPage(),
          ShoppingPage(),
        ],
      ),
      bottomNavigationBar: Consumer<CartService>(
        builder: (context, cartService, child) {
          return _IosTabBar(
            currentIndex: _currentIndex,
            onTap: changeview,
            cartCount: cartService.cartItemCount,
            favCount: cartService.favorites.length,
          );
        },
      ),
    );
  }
}

class _IosTabBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  final int cartCount;
  final int favCount;

  const _IosTabBar({
    required this.currentIndex,
    required this.onTap,
    required this.cartCount,
    required this.favCount,
  });

  Widget _buildIcon(IconData icon, int count) {
    if (count <= 0) {
      return Icon(icon);
    }

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Icon(icon),
        Positioned(
          right: -6,
          top: -6,
          child: Container(
            padding: const EdgeInsets.all(2),
            decoration: const BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
            ),
            constraints: const BoxConstraints(minWidth: 16, minHeight: 16),
            child: Text(
              count.toString(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      backgroundColor: AppColors.backround2,
      selectedItemColor: AppColors.iosBlue,
      unselectedItemColor: AppColors.textcolor2,
      type: BottomNavigationBarType.fixed,
      items: [
        const BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          activeIcon: Icon(Icons.home),
          label: 'Home',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          activeIcon: Icon(Icons.person),
          label: 'Profile',
        ),
        BottomNavigationBarItem(
          icon: _buildIcon(Icons.favorite_border, favCount),
          activeIcon: _buildIcon(Icons.favorite, favCount),
          label: 'Favorites',
        ),
        BottomNavigationBarItem(
          icon: _buildIcon(Icons.shopping_bag_outlined, cartCount),
          activeIcon: _buildIcon(Icons.shopping_bag, cartCount),
          label: 'Basket',
        ),
      ],
    );
  }
}
