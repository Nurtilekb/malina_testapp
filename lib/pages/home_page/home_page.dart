import 'package:flutter/material.dart';
import 'package:malina/widgets/grid_carts.dart';
import 'package:provider/provider.dart';
import 'package:malina/services/cart_service.dart';
import 'package:malina/themes/themData.dart';
import 'package:malina/widgets/banner_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartService>(
      builder: (context, cartService, child) {
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    const SizedBox(height: 16),
                    TextField(
                      decoration: InputDecoration(
                        hintText: "Search products...",
                        prefixIcon: const Icon(Icons.search),
                        suffixIcon: const Icon(Icons.tune),
                        filled: true,
                        fillColor: AppColors.backround2,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Баннер
                    BannerWidget(
                      height: 180,
                      banners: [
                        BannerData(
                          title: 'Скидка 30%',
                          subtitle: 'На все товары этой недели',
                          actionText: 'Купить сейчас',
                          icon: Icons.local_offer,
                          gradient: LinearGradient(
                            colors: [
                              Colors.purple.shade600,
                              Colors.purple.shade300,
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          onTap: () {
                            // Переход на страницу акций
                          },
                        ),
                        BannerData(
                          title: 'Новинки',
                          subtitle: 'Свежие поступления',
                          actionText: 'Смотреть',
                          icon: Icons.shopping_bag,
                          gradient: LinearGradient(
                            colors: [
                              Colors.blue.shade600,
                              Colors.blue.shade300,
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          onTap: () {
                            // Переход на новинки
                          },
                        ),
                        BannerData(
                          title: 'Бесплатная доставка',
                          subtitle: 'При заказе от 5000 ₽',
                          actionText: 'Заказать',
                          icon: Icons.local_shipping,
                          gradient: LinearGradient(
                            colors: [
                              Colors.orange.shade600,
                              Colors.orange.shade300,
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          onTap: () {
                            // Переход к заказу
                          },
                        ),
                      ],
                    ),
                    GridCarts(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
