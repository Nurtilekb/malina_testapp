import 'package:flutter/material.dart';
import 'package:malina/themes/themData.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  late List<Map<String, dynamic>> items;

  @override
  void initState() {
    super.initState();
    items = List.generate(
      5,
      (index) => {
        'id': 'item_$index',
        'name': 'Item ${index + 1}',
        'price': '${(index + 1) * 100}',
        'count': 0,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Избранное',
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: AppColors.backround1,
      ),
      body: items.isEmpty
          ? Center(
              child: Text(
                'Нет избранных товаров',
                style: TextStyle(color: Colors.grey[400], fontSize: 16),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return Dismissible(
                  key: ValueKey(item['id']),
                  direction: DismissDirection.horizontal,
                  onDismissed: (direction) {
                    final removedItem = items[index];
                    setState(() {
                      items.removeAt(index);
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          direction == DismissDirection.startToEnd
                              ? '${removedItem['name']} добавлено в корзину'
                              : '${removedItem['name']} удалено из избранного',
                        ),
                        duration: const Duration(seconds: 2),
                      ),
                    );
                  },
                  background: Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 20),
                    child: const Icon(
                      Icons.shopping_cart,
                      color: Colors.white,
                      size: 28,
                    ),
                  ),
                  secondaryBackground: Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.red.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(right: 20),
                    child: const Icon(
                      Icons.delete,
                      color: Colors.white,
                      size: 28,
                    ),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    height: 100, // ← Увеличил высоту для комфорта
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      color: AppColors.textcolor1,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 32, // ← Уменьшил с 40 до 32
                          backgroundColor: Colors.grey[300],
                          child: const Icon(
                            Icons.image,
                            size: 32, // ← Уменьшил иконку
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                item['name'],
                                style: const TextStyle(
                                  color: AppColors.backround1,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                '${item['price']} ₽',
                                style: const TextStyle(
                                  color: AppColors.backround1,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(width: 8),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove, size: 18),
                              color: Colors.green,
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(
                                minWidth: 28,
                                minHeight: 28,
                              ),
                              onPressed: () {
                                setState(() {
                                  if (item['count'] > 0) {
                                    item['count']--;
                                  }
                                });
                              },
                            ),
                            Text(
                              '${item['count']}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            IconButton(
                              icon: const Icon(Icons.add, size: 18),
                              color: Colors.green,
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(
                                minWidth: 28,
                                minHeight: 28,
                              ),
                              onPressed: () {
                                setState(() {
                                  item['count']++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
