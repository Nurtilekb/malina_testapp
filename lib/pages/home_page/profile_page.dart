import 'package:flutter/material.dart';
import 'package:malina/themes/themData.dart' show AppColors;
import 'package:malina/widgets/logOut_widget.dart';
import 'package:malina/widgets/prof_carts.dart';

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
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.backround1,
              AppColors.backround1.withOpacity(0.95),
            ],
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // Аватар с красивым оформлением
            _buildAvatar(),
            const SizedBox(height: 12),

            // Имя пользователя
            const Text(
              'A.Nurtilek',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColors.textcolor2,
              ),
            ),
            const SizedBox(height: 4),

            // Email
            Text(
              'a_nurtilek@gmail.com',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: AppColors.textcolor1.withOpacity(0.7),
              ),
            ),

            const Divider(
              color: Colors.amber,
              thickness: 1.5,
              indent: 60,
              endIndent: 60,
            ),
            SizedBox(height: 10),
            // Меню
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
              name: 'Мой адрес',
              icon: Icons.location_on_outlined,
              onPressed: () {},
            ),
            MoreInf(
              name: 'Кредитные карты',
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

            const SizedBox(height: 20),

            // Кнопка выхода
            LogOut(),
          ],
        ),
      ),
    );
  }

  Widget _buildAvatar() {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppColors.primarydarkcolor.withValues(alpha: 0.3),
                  blurRadius: 20,
                  spreadRadius: 5,
                ),
              ],
            ),
            child: const CircleAvatar(
              child: Icon(Icons.person, size: 60, color: Colors.white),
              radius: 65.0,
              backgroundColor: AppColors.textcolor1,
            ),
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
                border: Border.all(color: AppColors.backround1, width: 3),
              ),
              child: IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {},
                icon: const Icon(
                  Icons.camera_alt,
                  color: Colors.white,
                  size: 22,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
