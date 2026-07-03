import 'package:flutter/material.dart';

class ShoppingPage extends StatelessWidget {
  const ShoppingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        children: List.generate(3, (index) {
          return Card(
            color: Colors.grey[800],
            child: Center(
              child: Text(
                'Item ${index + 1}',
                style: const TextStyle(color: Colors.white),
              ),
            ),
          );
        }),
      ),
    );
  }
}
