import 'package:flutter/material.dart';
import 'package:malina/themes/themData.dart';

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
