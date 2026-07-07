import 'package:flutter/material.dart';
import 'package:malina/core/theme.dart';
import 'package:malina/services/order_service.dart';
import 'package:provider/provider.dart';

class TransactionsPage extends StatelessWidget {
  const TransactionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Транзакции',
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
            final totalSpent = orderService.totalSpent;

            return ListView(
              padding: const EdgeInsets.only(bottom: 100),
              children: [
                // Заголовок

                // Общая сумма
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [AppColors.iosBlue, AppColors.iosIndigo],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(AppRadius.lg),
                      boxShadow: AppShadows.card,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Всего потрачено',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white70,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '${totalSpent.toStringAsFixed(0)} ₽',
                          style: const TextStyle(
                            fontSize: 32,
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '${orders.length} заказов',
                          style: const TextStyle(
                            fontSize: 13,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                // Секция: История транзакций
                _buildSectionHeader('История транзакций'),

                if (orders.isEmpty)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      padding: const EdgeInsets.all(40),
                      decoration: BoxDecoration(
                        color: AppColors.cardBackground,
                        borderRadius: BorderRadius.circular(AppRadius.lg),
                        boxShadow: AppShadows.card,
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: AppColors.iosGray6,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.receipt_long_rounded,
                              size: 30,
                              color: AppColors.iosGray2,
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'Транзакций пока нет',
                            style: TextStyle(
                              color: AppColors.textcolor2,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            'После оформления заказа здесь появится история',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.iosGray,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                else
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.cardBackground,
                        borderRadius: BorderRadius.circular(AppRadius.lg),
                        boxShadow: AppShadows.card,
                      ),
                      child: Column(
                        children: [
                          for (int i = 0; i < orders.length; i++) ...[
                            _TransactionItem(order: orders[i]),
                            if (i < orders.length - 1)
                              const Padding(
                                padding: EdgeInsets.only(left: 62),
                                child: Divider(
                                  height: 0.5,
                                  thickness: 0.5,
                                  color: AppColors.bordercolor,
                                ),
                              ),
                          ],
                        ],
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 0, 20, 8),
      child: Text(
        title.toUpperCase(),
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: AppColors.iosGray,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}

class _TransactionItem extends StatelessWidget {
  final Order order;

  const _TransactionItem({required this.order});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
      child: Row(
        children: [
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: AppColors.iosGreen.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.shopping_bag_rounded,
              color: AppColors.iosGreen,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Заказ ${order.id}',
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textcolor2,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  order.formattedDate,
                  style: TextStyle(fontSize: 12, color: AppColors.iosGray),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '-${order.total.toStringAsFixed(0)} ₽',
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textcolor2,
                ),
              ),
              const SizedBox(height: 2),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: _statusColor(order.status).withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(AppRadius.pill),
                ),
                child: Text(
                  "_statusText(order.status)",
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: _statusColor(order.status),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Color _statusColor(OrderStatus status) {
    switch (status) {
      case OrderStatus.placed:
        return AppColors.iosBlue;
      case OrderStatus.confirmed:
        return AppColors.iosOrange;
      case OrderStatus.shipped:
        return AppColors.iosPurple;
      case OrderStatus.delivered:
        return AppColors.iosGreen;
    }
  }

  // String _statusText(OrderStatus status) {
  //   switch (status) {
  //     case OrderStatus.placed:
  //       'Размещён';
  //     case OrderStatus.confirmed:
  //       'Подтверждён';
  //     case OrderStatus.shipped:
  //       'Отправлен';
  //     case OrderStatus.delivered:
  //       'Доставлен';
  //   }
  // }
}
