import 'package:flutter/material.dart';
import 'package:malina/core/theme.dart';
import 'package:malina/services/order_service.dart';
import 'package:malina/widgets/order_cart.dart';
import 'package:provider/provider.dart';

class MyOrders extends StatelessWidget {
  const MyOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Мои заказы',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w800,
            color: AppColors.textcolor2,
            letterSpacing: -0.5,
          ),
        ),
      ),
      backgroundColor: AppColors.backround2,
      body: SafeArea(
        child: Consumer<OrderService>(
          builder: (context, orderService, child) {
            final orders = orderService.orders;

            return ListView(
              padding: const EdgeInsets.only(bottom: 100),
              children: [
                // Заголовок
                if (orders.isEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 100),
                    child: Column(
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            color: AppColors.iosGray6,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.shopping_bag_outlined,
                            size: 40,
                            color: AppColors.iosGray2,
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'Заказов пока нет',
                          style: TextStyle(
                            color: AppColors.textcolor2,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          'Оформите первый заказ в корзине',
                          style: TextStyle(
                            color: AppColors.iosGray,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  )
                else
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 8, 20, 0),
                    child: Column(
                      children: [
                        for (int i = 0; i < orders.length; i++) ...[
                          OrderCart(order: orders[i]),
                          if (i < orders.length - 1) const SizedBox(height: 10),
                        ],
                      ],
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
