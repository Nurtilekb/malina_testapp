import 'package:flutter/material.dart';
import 'package:malina/core/theme.dart';

class OrderCart extends StatefulWidget {
  const OrderCart({super.key});

  @override
  State<OrderCart> createState() => _OrderCArtState();
}

class _OrderCArtState extends State<OrderCart> {
  final ExpansibleController ctrl = ExpansibleController();
  bool _isExpanded = false;

  @override
  void dispose() {
    ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                          const Text(
                            'Order #90345',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: AppColors.textcolor2,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            'Placed on Octobar 19 2021',
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.iosGray,
                            ),
                          ),
                          Row(
                            children: [
                              Text('items: 10', style: TextStyle(fontSize: 12)),
                              SizedBox(width: 10),
                              Text(
                                'items: 16.89 dol',
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
                  SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: [
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
                              color: AppColors.iosBlue,
                            ),
                            CircleAvatar(
                              radius: 5,
                              backgroundColor: AppColors.iosBlue,
                            ),
                            Container(
                              width: 2,
                              height: 30,
                              color: AppColors.iosGray2,
                            ),
                            CircleAvatar(
                              radius: 5,
                              backgroundColor: AppColors.iosGray2,
                            ),
                          ],
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Заказ размещен:",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: 20),
                              Text(
                                "Заказ подтвержден:",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: 20),
                              Text(
                                "Заказ отправлен:",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: 20),
                              Text(
                                "Заказ доставлен:",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Oct 19 2021",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(height: 20),
                            Text(
                              "Oct 20 2021",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(height: 20),
                            Text(
                              "Oct 20 2021",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(height: 20),
                            Text(
                              "В ожидании.",
                              style: TextStyle(
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
