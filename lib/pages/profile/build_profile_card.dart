import 'package:flutter/material.dart';
import 'package:malina/core/theme.dart';
import 'package:malina/pages/profile/about_me_screen.dart';

class BuildProfileCard extends StatelessWidget {
  const BuildProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(AppRadius.lg),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AboutMEScreen()),
        );
      },
      child: Container(
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
                  child: GestureDetector(
                    onTap: () {
                      print('Тут выходит шоу диолог ');
                    },
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
                ),
              ],
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Nurtilek Abdulahatov',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textcolor2,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'example@gmail.com',
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
      ),
    );
    ;
  }
}
