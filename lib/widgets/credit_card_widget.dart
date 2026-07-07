import 'package:flutter/material.dart';
import 'package:malina/core/theme.dart';
import 'package:malina/services/cedite_card_service.dart';

class CreditCardWidget extends StatelessWidget {
  final BankCard card;
  final VoidCallback? onTap;

  const CreditCardWidget({super.key, required this.card, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 200,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: _gradientForCard(card.bankName),
          ),
          borderRadius: BorderRadius.circular(AppRadius.lg),
          boxShadow: AppShadows.card,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Верх: банк + чип
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  card.bankName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Icon(
                  Icons.credit_card_rounded,
                  color: Colors.white70,
                  size: 28,
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Номер карты
            Text(
              '•••• •••• •••• ${card.last4Digits}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w600,
                letterSpacing: 2,
              ),
            ),
            const SizedBox(height: 20),

            // Низ: имя + срок
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  card.cardHolder,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  card.expiryDate,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),

            // Бейдж "По умолчанию"
            if (card.isDefault) ...[
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(AppRadius.pill),
                ),
                child: const Text(
                  'По умолчанию',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  List<Color> _gradientForCard(String bankName) {
    switch (bankName.toLowerCase()) {
      case 'tinkoff':
        return [const Color(0xFFFFD700), const Color(0xFFFFA500)];
      case 'sberbank':
        return [const Color(0xFF21A038), const Color(0xFF006633)];
      default:
        return [AppColors.iosBlue, AppColors.iosIndigo];
    }
  }
}
