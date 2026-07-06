import 'dart:core';

import 'package:flutter/material.dart';
import 'package:malina/core/theme.dart';
import 'package:malina/widgets/order_cart.dart';

class MyOrders extends StatefulWidget {
  const MyOrders({super.key});

  @override
  State<MyOrders> createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
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
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 20, 0),
              child: Row(children: [
                
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 0),
              child: Column(
                children: [
                  OrderCart(),
                  SizedBox(height: 10),
                  OrderCart(),
                  SizedBox(height: 10),
                  OrderCart(),
                  SizedBox(height: 10),
                  OrderCart(),
                  SizedBox(height: 10),
                  OrderCart(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
