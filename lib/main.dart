import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:malina/pages/auth_page/login_page.dart';
import 'package:malina/pages/home_page/favs_page.dart';
import 'package:provider/provider.dart';

import 'package:malina/pages/home_page/home_page.dart';
import 'package:malina/pages/home_page/profile_page.dart';
import 'package:malina/pages/home_page/basket_page.dart';
import 'package:malina/services/cart_service.dart';
import 'package:malina/themes/themData.dart';

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
      home: const LoginPage(),
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

/// iOS-стиль нижнего таб-бара с frosted-glass эффектом
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

  @override
  Widget build(BuildContext context) {
    final items = [
      _TabItem(icon: Icons.house_rounded, label: 'Главная', badge: 0),
      _TabItem(icon: Icons.person_rounded, label: 'Профиль', badge: 0),
      _TabItem(
        icon: Icons.favorite_rounded,
        label: 'Избранное',
        badge: favCount,
      ),
      _TabItem(
        icon: Icons.shopping_bag_rounded,
        label: 'Корзина',
        badge: cartCount,
      ),
    ];

    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: Container(
          decoration: const BoxDecoration(
            color: Color(0xCCFFFFFF),
            border: Border(
              top: BorderSide(color: AppColors.bordercolor, width: 0.5),
            ),
          ),
          child: SafeArea(
            top: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Row(
                children: List.generate(items.length, (index) {
                  final item = items[index];
                  final isSelected = index == currentIndex;
                  final color = isSelected
                      ? AppColors.iosBlue
                      : AppColors.iosGray;

                  return Expanded(
                    child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () => onTap(index),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 2),
                                child: Icon(item.icon, color: color, size: 26),
                              ),
                              if (item.badge > 0)
                                Positioned(
                                  top: -4,
                                  right: 10,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 5,
                                      vertical: 1,
                                    ),
                                    decoration: BoxDecoration(
                                      color: AppColors.iosRed,
                                      borderRadius: BorderRadius.circular(
                                        AppRadius.pill,
                                      ),
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 1.5,
                                      ),
                                    ),
                                    constraints: const BoxConstraints(
                                      minWidth: 18,
                                      minHeight: 18,
                                    ),
                                    child: Text(
                                      '${item.badge}',
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                          const SizedBox(height: 2),
                          Text(
                            item.label,
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: isSelected
                                  ? FontWeight.w600
                                  : FontWeight.w400,
                              color: color,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _TabItem {
  final IconData icon;
  final String label;
  final int badge;

  const _TabItem({
    required this.icon,
    required this.label,
    required this.badge,
  });
}
