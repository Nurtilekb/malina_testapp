import 'package:flutter/material.dart';
import 'package:malina/pages/profile/about_me_screen.dart';
import 'package:malina/core/theme.dart' show AppColors, AppRadius, AppShadows;
import 'package:malina/widgets/logout_widget.dart';
import 'package:malina/widgets/profile_item.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backround2,
      body: SafeArea(
        bottom: false,
        child: ListView(
          padding: const EdgeInsets.only(bottom: 100),
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
              child: _buildProfileCard(),
            ),

            const SizedBox(height: 24),

            // Секция: Аккаунт
            _buildSectionHeader('Аккаунт'),
            _buildSection([
              MoreInf(
                name: 'Обо мне',
                icon: Icons.person_4_rounded,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AboutMEScreen(),
                    ),
                  );
                },
              ),
              MoreInf(
                name: 'Мои заказы',
                icon: Icons.shopping_bag_rounded,
                onPressed: () {},
              ),
              MoreInf(
                name: 'Мои любимые',
                icon: Icons.favorite_rounded,
                onPressed: () {},
              ),
            ]),

            const SizedBox(height: 24),

            // Секция: Настройки
            _buildSectionHeader('Настройки'),
            _buildSection([
              MoreInf(
                name: 'Кредитные карты',
                icon: Icons.credit_card_rounded,
                onPressed: () {},
              ),
              MoreInf(
                name: 'Транзакции',
                icon: Icons.swap_horiz_rounded,
                onPressed: () {},
              ),
              MoreInf(
                name: 'Уведомления',
                icon: Icons.notifications_rounded,
                onPressed: () {},
              ),
            ]),

            const SizedBox(height: 24),

            // Выход
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: LogOut(),
            ),
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

  Widget _buildProfileCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        boxShadow: AppShadows.card,
      ),
      child: Row(
        children: [
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.iosBlue.withValues(alpha: 0.2),
                      blurRadius: 16,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: const CircleAvatar(
                  radius: 40,
                  backgroundColor: AppColors.iosGray5,
                  child: Icon(
                    Icons.person_rounded,
                    size: 44,
                    color: AppColors.iosGray2,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    color: AppColors.iosBlue,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2.5),
                  ),
                  child: const Icon(
                    Icons.camera_alt_rounded,
                    color: Colors.white,
                    size: 14,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'A.Nurtilek',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textcolor2,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'a_nurtilek@gmail.com',
                  style: TextStyle(fontSize: 14, color: AppColors.iosGray),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.chevron_right_rounded,
            color: AppColors.iosGray3,
            size: 24,
          ),
        ],
      ),
    );
  }
}
