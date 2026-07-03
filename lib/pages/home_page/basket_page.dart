import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:malina/services/cart_service.dart';
import 'package:malina/themes/themData.dart';

class ShoppingPage extends StatelessWidget {
  const ShoppingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartService>(
      builder: (context, cartService, child) {
        final cart = cartService.cart;

        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Корзина',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            backgroundColor: AppColors.backround1,
            actions: cart.isNotEmpty
                ? [
                    IconButton(
                      icon: const Icon(Icons.delete_outline, color: Colors.red),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('Очистить корзину?'),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('Отмена'),
                              ),
                              TextButton(
                                onPressed: () {
                                  cartService.clearCart();
                                  Navigator.pop(context);
                                },
                                child: const Text('Очистить'),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ]
                : null,
          ),
          body: cart.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.shopping_cart_outlined,
                        size: 80,
                        color: AppColors.textcolor1,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Корзина пуста',
                        style: TextStyle(
                          color: AppColors.textcolor1,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Добавьте товары из каталога',
                        style: TextStyle(color: Colors.grey[500], fontSize: 14),
                      ),
                    ],
                  ),
                )
              : Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.all(12),
                        itemCount: cart.length,
                        itemBuilder: (context, index) {
                          final item = cart[index];
                          return Dismissible(
                            key: Key(item.product.id),
                            direction: DismissDirection.endToStart,
                            onDismissed: (direction) {
                              cartService.removeFromCart(item.product.id);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    '${item.product.name} удалён из корзины',
                                  ),
                                  duration: const Duration(seconds: 2),
                                ),
                              );
                            },
                            background: Container(
                              alignment: Alignment.centerRight,
                              padding: const EdgeInsets.only(right: 20),
                              decoration: BoxDecoration(
                                color: Colors.red.withOpacity(0.8),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Icon(
                                Icons.delete,
                                color: Colors.white,
                              ),
                            ),
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 12),
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: AppColors.textcolor1,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    width: 80,
                                    height: 80,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[300],
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: const Icon(
                                      Icons.shopping_bag,
                                      size: 40,
                                      color: Colors.white70,
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          item.product.name,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.textcolor2,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          '${item.product.price} ₽',
                                          style: const TextStyle(
                                            fontSize: 14,
                                            color: AppColors.primarydarkcolor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Colors.grey[800],
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                            ),
                                            child: Row(
                                              children: [
                                                IconButton(
                                                  icon: const Icon(
                                                    Icons.remove,
                                                    size: 18,
                                                    color: AppColors
                                                        .primarydarkcolor,
                                                  ),
                                                  padding: EdgeInsets.zero,
                                                  constraints:
                                                      const BoxConstraints(
                                                        minWidth: 28,
                                                        minHeight: 28,
                                                      ),
                                                  onPressed: () {
                                                    cartService.updateQuantity(
                                                      item.product.id,
                                                      item.quantity - 1,
                                                    );
                                                  },
                                                ),
                                                Text(
                                                  '${item.quantity}',
                                                  style: const TextStyle(
                                                    color: AppColors.backround1,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                IconButton(
                                                  icon: const Icon(
                                                    Icons.add,
                                                    size: 18,
                                                    color: AppColors
                                                        .primarydarkcolor,
                                                  ),
                                                  padding: EdgeInsets.zero,
                                                  constraints:
                                                      const BoxConstraints(
                                                        minWidth: 28,
                                                        minHeight: 28,
                                                      ),
                                                  onPressed: () {
                                                    cartService.updateQuantity(
                                                      item.product.id,
                                                      item.quantity + 1,
                                                    );
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        '${item.product.price * item.quantity} ₽',
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.primarydarkcolor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColors.backround2,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 8,
                            offset: const Offset(0, -2),
                          ),
                        ],
                      ),
                      child: SafeArea(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Итого:',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  '${cartService.totalPrice.toStringAsFixed(0)} ₽',
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.primarydarkcolor,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Заказ оформлен!'),
                                      backgroundColor:
                                          AppColors.primarydarkcolor,
                                    ),
                                  );
                                  cartService.clearCart();
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.primarydarkcolor,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 16,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: const Text(
                                  'Оформить заказ',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
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
        );
      },
    );
  }
}
