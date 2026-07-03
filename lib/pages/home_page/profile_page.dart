import 'package:flutter/material.dart';
import 'package:malina/themes/themData.dart' show AppColors;

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 30,
        title: const Text(
          'Профиль',
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: AppColors.backround1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  const CircleAvatar(
                    child: Icon(Icons.person, size: 60, color: Colors.white),
                    radius: 65.0,
                    backgroundColor: AppColors.textcolor1,
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: AppColors.primarydarkcolor,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8),
            Center(
              child: const Text(
                'A.Nurtilek',
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.textcolor2,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Center(
              child: const Text(
                'a_nurtilek@gmail.com',
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.textcolor1,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Center(
              child: const SizedBox(
                height: 15.0,
                width: double.infinity,
                child: Divider(color: Colors.amber),
              ),
            ),
            const SizedBox(height: 10.0),
            MoreInf(
              name: 'Обо мне',
              icon: Icons.person_4_outlined,
              onPressed: () {},
            ),
            MoreInf(
              name: 'Мои заказы',
              icon: Icons.shopping_bag_outlined,
              onPressed: () {},
            ),
            MoreInf(
              name: 'Мои любимые',
              icon: Icons.favorite_border_outlined,
              onPressed: () {},
            ),
            MoreInf(
              name: 'Мой адресс',
              icon: Icons.location_on_outlined,
              onPressed: () {},
            ),
            MoreInf(
              name: 'Кредитые карты',
              icon: Icons.credit_card_outlined,
              onPressed: () {},
            ),
            MoreInf(
              name: 'Транзакции',
              icon: Icons.transfer_within_a_station_outlined,
              onPressed: () {},
            ),
            MoreInf(
              name: 'Уведомления',
              icon: Icons.notifications_outlined,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class MoreInf extends StatelessWidget {
  String name;
  IconData? icon;
  Function()? onPressed;
  MoreInf({
    required this.name,
    required this.icon,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12), // Обрезаем всё, что выходит
      child: Material(
        color: Colors.transparent,
        child: Column(
          children: [
            InkWell(
              onTap: () {
                onPressed?.call();
              },
              child: Container(
                padding: const EdgeInsets.all(8.0),
                width: double.infinity,
                height: 55,
                color:
                    AppColors.backround3, // Используем color вместо decoration
                child: Row(
                  children: [
                    Icon(icon, color: AppColors.primarydarkcolor),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        name,
                        style: TextStyle(
                          color: AppColors.textcolor2,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios, color: AppColors.textcolor1),
                  ],
                ),
              ),
            ),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
