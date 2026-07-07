import 'package:flutter/material.dart';
import 'package:malina/core/theme.dart';
import 'package:malina/services/order_service.dart';

class OrderCart extends StatefulWidget {
  final Order order;

  const OrderCart({super.key, required this.order});

  @override
  State<OrderCart> createState() => _OrderCartState();
}

class _OrderCartState extends State<OrderCart> {
  final ExpansibleController ctrl = ExpansibleController();
  bool _isExpanded = false;

  @override
  void dispose() {
    ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final order = widget.order;
    final status = order.status;

    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: ColoredBox(
        color: AppColors.cardBackground,
        child: Material(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Theme(
              data: Theme.of(
                context,
              ).copyWith(dividerColor: Colors.transparent),
              child: ExpansionTile(
                onExpansionChanged: (expanded) {
                  setState(() {
                    _isExpanded = expanded;
                  });
                },
                trailing: AnimatedRotation(
                  turns: _isExpanded ? 0.5 : 0,
                  duration: const Duration(milliseconds: 200),
                  child: Icon(
                    Icons.arrow_drop_down_circle_outlined,
                    color: AppColors.iosBlue,
                  ),
                ),
                splashColor: Colors.transparent,
                iconColor: AppColors.iosBlue,
                backgroundColor: Colors.transparent,
                expandedAlignment: Alignment.centerLeft,
                maintainState: true,
                controller: ctrl,
                leading: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: AppColors.iosBlue,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2.5),
                  ),
                  child: const Icon(
                    Icons.local_shipping_outlined,
                    color: Colors.white,
                    size: 34,
                  ),
                ),
                title: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Заказ ${order.id}',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AppColors.textcolor2,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            'От ${order.formattedDate}',
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.iosGray,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                'Товаров: ${order.itemCount}',
                                style: TextStyle(fontSize: 12),
                              ),
                              const SizedBox(width: 10),
                              Text(
                                'Сумма: ${order.total.toStringAsFixed(0)} ₽',
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                children: [
                  const SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: [
                        // Точки статусов
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: 5,
                              backgroundColor: AppColors.iosBlue,
                            ),
                            Container(
                              width: 2,
                              height: 30,
                              color: AppColors.iosBlue,
                            ),
                            CircleAvatar(
                              radius: 5,
                              backgroundColor: AppColors.iosBlue,
                            ),
                            Container(
                              width: 2,
                              height: 35,
                              color: status.index >= OrderStatus.shipped.index
                                  ? AppColors.iosBlue
                                  : AppColors.iosGray2,
                            ),
                            CircleAvatar(
                              radius: 5,
                              backgroundColor:
                                  status.index >= OrderStatus.shipped.index
                                  ? AppColors.iosBlue
                                  : AppColors.iosGray2,
                            ),
                            Container(
                              width: 2,
                              height: 30,
                              color: status.index >= OrderStatus.delivered.index
                                  ? AppColors.iosBlue
                                  : AppColors.iosGray2,
                            ),
                            CircleAvatar(
                              radius: 5,
                              backgroundColor:
                                  status.index >= OrderStatus.delivered.index
                                  ? AppColors.iosBlue
                                  : AppColors.iosGray2,
                            ),
                          ],
                        ),
                        const SizedBox(width: 12),
                        // Названия статусов
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Text(
                                "Заказ размещён:",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 20),
                              const Text(
                                "Заказ подтверждён:",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 20),
                              const Text(
                                "Заказ отправлен:",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 20),
                              const Text(
                                "Заказ доставлен:",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Даты статусов
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              order.formattedDate,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              order.formattedDate,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              status.index >= OrderStatus.shipped.index
                                  ? order.formattedDate
                                  : "В ожидании.",
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              status.index >= OrderStatus.delivered.index
                                  ? order.formattedDate
                                  : "В ожидании.",
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
