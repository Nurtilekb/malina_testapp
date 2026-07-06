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
          backgroundColor: AppColors.backround2,
          body: SafeArea(
            bottom: false,
            child: CustomScrollView(
              slivers: [
                // Большой заголовок в стиле iOS
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 12, 20, 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Malina',
                          style: TextStyle(
                            fontSize: 34,
                            fontWeight: FontWeight.w800,
                            color: AppColors.textcolor2,
                            letterSpacing: -0.5,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Добро пожаловать! 👋',
                          style: TextStyle(
                            fontSize: 15,
                            color: AppColors.textcolor1,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Поиск
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 12, 20, 8),
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.iosGray6,
                        borderRadius: BorderRadius.circular(AppRadius.md),
                      ),
                      child: TextField(
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.textcolor2,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Поиск товаров...',
                          hintStyle: TextStyle(
                            color: AppColors.iosGray,
                            fontSize: 16,
                          ),
                          prefixIcon: Icon(
                            Icons.search,
                            color: AppColors.iosGray,
                            size: 22,
                          ),
                          suffixIcon: Icon(
                            Icons.tune_rounded,
                            color: AppColors.iosGray,
                            size: 22,
                          ),
                          filled: true,
                          fillColor: Colors.transparent,
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 14,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                // Контент
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: BannerWidget(
                      height: 180,
                      banners: [
                        BannerData(
                          title: 'Скидка 30%',
                          subtitle: 'На все товары этой недели',
                          actionText: 'Купить сейчас',
                          icon: Icons.local_offer_rounded,
                          gradient: const LinearGradient(
                            colors: [AppColors.iosPurple, Color(0xFFD1A3FF)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          onTap: () {},
                        ),
                        BannerData(
                          title: 'Новинки',
                          subtitle: 'Свежие поступления',
                          actionText: 'Смотреть',
                          icon: Icons.shopping_bag_rounded,
                          gradient: const LinearGradient(
                            colors: [AppColors.iosBlue, Color(0xFF66B2FF)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          onTap: () {},
                        ),
                        BannerData(
                          title: 'Бесплатная доставка',
                          subtitle: 'При заказе от 5000 ₽',
                          actionText: 'Заказать',
                          icon: Icons.local_shipping_rounded,
                          gradient: const LinearGradient(
                            colors: [AppColors.iosOrange, Color(0xFFFFBE7D)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                ),

                // Секция «Товары»
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 8, 20, 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Популярное',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            color: AppColors.textcolor2,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Все',
                            style: TextStyle(
                              color: AppColors.iosBlue,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Сетка товаров
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(20, 4, 20, 100),
                  sliver: SliverToBoxAdapter(child: GridCarts()),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
