import 'package:flutter/material.dart';
import 'package:malina/pages/profile/about_me_screen.dart';
import 'package:malina/pages/profile/build_profile_card.dart';
import 'package:malina/pages/profile/my_orders.dart';
import 'package:malina/pages/home/favs_page.dart';
import 'package:malina/pages/profile/cards_page.dart';
import 'package:malina/core/theme.dart' show AppColors, AppRadius, AppShadows;
import 'package:malina/pages/profile/notification_page.dart';
import 'package:malina/pages/profile/transactions_page.dart';
import 'package:malina/widgets/logout_widget.dart';
import 'package:malina/widgets/profile_item.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backround2,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Заголовок
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 12, 20, 8),
              child: Text(
                'Профиль',
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.w800,
                  color: AppColors.textcolor2,
                  letterSpacing: -0.5,
                ),
              ),
            ),

            // Карточка профиля
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: BuildProfileCard(),
            ),

            const SizedBox(height: 24),

            // Секция: Аккаунт
            _buildSectionHeader('Аккаунт'),
            _buildSection([
              MoreInf(
                name: 'Мои заказы',
                icon: Icons.shopping_bag_rounded,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MyOrders()),
                  );
                },
              ),
              MoreInf(
                name: 'Мои любимые',
                icon: Icons.favorite_rounded,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FavoritesPage(),
                    ),
                  );
                },
              ),
            ]),

            const SizedBox(height: 24),

            // Секция: Настройки
            _buildSectionHeader('Настройки'),
            _buildSection([
              MoreInf(
                name: 'Кредитные карты',
                icon: Icons.credit_card_rounded,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CardsPage()),
                  );
                },
              ),
              MoreInf(
                name: 'Транзакции',
                icon: Icons.swap_horiz_rounded,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TransactionsPage(),
                    ),
                  );
                },
              ),
              MoreInf(
                name: 'Уведомления',
                icon: Icons.notifications_rounded,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NiotificationPage(),
                    ),
                  );
                },
              ),
            ]),

            const SizedBox(height: 24),
            Spacer(),
            // Выход
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: LogOut(),
            ),
            const SizedBox(height: 24),
          ],
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

  Widget _buildSection(List<Widget> items) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          borderRadius: BorderRadius.circular(AppRadius.lg),
          boxShadow: AppShadows.card,
        ),
        child: Column(
          children: [
            for (int i = 0; i < items.length; i++) ...[
              items[i],
              if (i < items.length - 1)
                const Padding(
                  padding: EdgeInsets.only(left: 52),
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
    );
  }
}
