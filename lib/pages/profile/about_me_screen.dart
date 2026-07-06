import 'package:flutter/material.dart';
import 'package:malina/core/theme.dart';
import 'package:malina/pages/profile/edit_profile_screen.dart';

class AboutMEScreen extends StatelessWidget {
  const AboutMEScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backround2,
      body: SafeArea(
        bottom: false,
        child: ListView(
          padding: const EdgeInsets.only(bottom: 100),
          children: [
            // Кнопка "Назад" + заголовок
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 20, 0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Padding(
                      padding: EdgeInsets.all(12),
                      child: Icon(
                        Icons.chevron_left_rounded,
                        color: AppColors.iosBlue,
                        size: 28,
                      ),
                    ),
                  ),
                  const Text(
                    'Обо мне',
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.w800,
                      color: AppColors.textcolor2,
                      letterSpacing: -0.5,
                    ),
                  ),
                ],
              ),
            ),

            // Аватар + имя
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Column(
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
                      radius: 56,
                      backgroundColor: AppColors.iosGray5,
                      child: Icon(
                        Icons.person_rounded,
                        size: 56,
                        color: AppColors.iosGray2,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Nurtilek Abdulahatov',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textcolor2,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'nurtilekabdulahatov@gmail.com',
                    style: TextStyle(fontSize: 15, color: AppColors.iosGray),
                  ),
                ],
              ),
            ),

            // Секция: Личная информация
            _buildSectionHeader('Личная информация'),
            _buildSection([
              _InfoRow(
                title: 'Имя',
                value: 'Нуртилек Абдулахатов',
                icon: Icons.person_rounded,
                iconColor: AppColors.iosBlue,
              ),
              _InfoRow(
                title: 'Телефон',
                value: '+996 991 199',
                icon: Icons.phone_rounded,
                iconColor: AppColors.iosGreen,
              ),
              _InfoRow(
                title: 'Адрес',
                value: 'Горький ул., Бишкек',
                icon: Icons.location_on_rounded,
                iconColor: AppColors.iosOrange,
              ),
              _InfoRow(
                title: 'Email',
                value: 'nurtilekabdulahatov@gmail.com',
                icon: Icons.mail_rounded,
                iconColor: AppColors.iosPurple,
              ),
            ]),

            const SizedBox(height: 24),

            // Кнопка "Редактировать"
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            EditProfileScreen(onImageChanged: (image) {}),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.iosBlue,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppRadius.md),
                    ),
                  ),
                  child: const Text(
                    'Редактировать профиль',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
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
}

class _InfoRow extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color iconColor;

  const _InfoRow({
    required this.title,
    required this.value,
    required this.icon,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
      child: Row(
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: iconColor,
              borderRadius: BorderRadius.circular(7),
            ),
            child: Icon(icon, color: Colors.white, size: 17),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: AppColors.iosGray,
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: const TextStyle(
                    color: AppColors.textcolor2,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.chevron_right_rounded,
            color: AppColors.iosGray3,
            size: 22,
          ),
        ],
      ),
    );
  }
}
