import 'package:flutter/material.dart';
import 'package:malina/core/theme.dart';

class NotifCarts extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final String maintext;
  final String descriptiontext;
  NotifCarts({
    required this.value,
    required this.onChanged,
    required this.maintext,
    required this.descriptiontext,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // use the widget's fields `maintext` and `descriptiontext`
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      height: 103,
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        boxShadow: AppShadows.card,
      ),
      child: Row(
        children: [
          const Icon(Icons.camera_alt_rounded, color: Colors.white, size: 14),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  maintext,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textcolor2,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  descriptiontext,
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.iosGray,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 70,
            child: Center(
              child: Transform.scale(
                scale: 0.8,
                child: Switch(
                  activeThumbColor: AppColors.backround1,
                  activeTrackColor: const Color(0xff6CC51D),

                  inactiveTrackColor: AppColors.backround1,

                  value: value,
                  onChanged: onChanged,
                  thumbIcon: WidgetStateProperty.resolveWith<Icon?>((
                    Set<WidgetState> states,
                  ) {
                    if (states.contains(WidgetState.disabled)) {
                      return const Icon(Icons.close);
                    }
                    return null; // All other states will use the default thumbIcon.
                  }),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
