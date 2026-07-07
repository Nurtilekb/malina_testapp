import 'package:flutter/material.dart';

class OrderItem {
  final String productId;
  final String name;
  final double price;
  final int quantity;

  OrderItem({
    required this.productId,
    required this.name,
    required this.price,
    required this.quantity,
  });
}

class Order {
  final String id;
  final List<OrderItem> items;
  final double total;
  final DateTime date;
  final OrderStatus status;

  Order({
    required this.id,
    required this.items,
    required this.total,
    required this.date,
    this.status = OrderStatus.placed,
  });

  int get itemCount => items.fold(0, (sum, item) => sum + item.quantity);

  String get formattedDate {
    const months = [
      'Янв', 'Фев', 'Мар', 'Апр', 'Май', 'Июн',
      'Июл', 'Авг', 'Сен', 'Окт', 'Ноя', 'Дек'
    ];
    return '${date.day} ${months[date.month - 1]} ${date.year}';
  }
}

enum OrderStatus {
  placed,      // Заказ размещён
  confirmed,   // Заказ подтверждён
  shipped,     // Заказ отправлен
  delivered,   // Заказ доставлен
}

class OrderService extends ChangeNotifier {
  final List<Order> _orders = [];

  List<Order> get orders => List.unmodifiable(_orders.reversed);

  void createOrder(List<OrderItem> items, double total) {
    if (items.isEmpty) return;

    final order = Order(
      id: 'ORD-${DateTime.now().millisecondsSinceEpoch}',
      items: items,
      total: total,
      date: DateTime.now(),
    );
    _orders.add(order);
    notifyListeners();
  }

  int get totalOrders => _orders.length;

  double get totalSpent => _orders.fold(0, (sum, o) => sum + o.total);
}
