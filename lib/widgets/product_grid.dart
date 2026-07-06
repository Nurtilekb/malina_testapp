import 'package:flutter/material.dart';
import 'package:malina/core/theme.dart';
import 'package:malina/services/cart_service.dart';
import 'package:provider/provider.dart';

class GridCarts extends StatelessWidget {
  const GridCarts({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartService>(
      builder: (context, cartService, child) {
        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 14,
            mainAxisSpacing: 14,
            childAspectRatio: 0.72,
          ),
          itemCount: cartService.products.length,
          itemBuilder: (context, index) {
            final product = cartService.products[index];
            final isFavorite = cartService.isFavorite(product.id);

            return Container(
              decoration: BoxDecoration(
                color: AppColors.cardBackground,
                borderRadius: BorderRadius.circular(AppRadius.lg),
                boxShadow: AppShadows.card,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(AppRadius.lg),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Изображение / плейсхолдер
                    Expanded(
                      flex: 5,
                      child: Stack(
                        children: [
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  AppColors.iosGray6,
                                  AppColors.iosGray5,
                                ],
                              ),
                            ),
                            child: Center(
                              child: Icon(
                                Icons.shopping_bag_rounded,
                                size: 44,
                                color: AppColors.iosGray3,
                              ),
                            ),
                          ),
                          // Кнопка избранного
                          Positioned(
                            top: 8,
                            right: 8,
                            child: GestureDetector(
                              onTap: () {
                                cartService.toggleFavorite(product.id);
                              },
                              child: Container(
                                width: 32,
                                height: 32,
                                decoration: BoxDecoration(
                                  color: Colors.white.withValues(alpha: 0.85),
                                  shape: BoxShape.circle,
                                  boxShadow: AppShadows.soft,
                                ),
                                child: Icon(
                                  isFavorite
                                      ? Icons.favorite
                                      : Icons.favorite_border_rounded,
                                  size: 17,
                                  color: isFavorite
                                      ? AppColors.iosRed
                                      : AppColors.iosGray2,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Инфо
                    Expanded(
                      flex: 4,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: AppColors.textcolor2,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              '${product.price.toStringAsFixed(0)} ₽',
                              style: TextStyle(
                                color: AppColors.iosBlue,
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const Spacer(),
                            SizedBox(
                              width: double.infinity,
                              height: 34,
                              child: Material(
                                color: AppColors.iosBlue,
                                borderRadius: BorderRadius.circular(
                                  AppRadius.sm,
                                ),
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(
                                    AppRadius.sm,
                                  ),
                                  onTap: () {
                                    cartService.addToCart(product.id);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          '${product.name} добавлен в корзину',
                                        ),
                                        duration: const Duration(seconds: 1),
                                        backgroundColor: AppColors.iosGreen,
                                        behavior: SnackBarBehavior.floating,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            AppRadius.sm,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  child: const Center(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          Icons.add_rounded,
                                          color: Colors.white,
                                          size: 18,
                                        ),
                                        SizedBox(width: 4),
                                        Text(
                                          'В корзину',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
