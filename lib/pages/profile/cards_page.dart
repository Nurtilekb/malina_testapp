import 'package:flutter/material.dart';
import 'package:malina/core/theme.dart';
import 'package:malina/services/cedite_card_service.dart';
import 'package:malina/widgets/credit_card_widget.dart';
import 'package:provider/provider.dart';

class CardsPage extends StatefulWidget {
  const CardsPage({super.key});

  @override
  State<CardsPage> createState() => _CardsPageState();
}

class _CardsPageState extends State<CardsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Карты',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w800,
            color: AppColors.textcolor2,
            letterSpacing: -0.5,
          ),
        ),
      ),
      backgroundColor: AppColors.backround2,
      body: SafeArea(
        child: Consumer<CardService>(
          builder: (context, cardService, child) {
            final cards = cardService.cards;

            return ListView(
              padding: const EdgeInsets.only(bottom: 100),
              children: [
                // Заголовок
                const SizedBox(height: 16),

                // Список карт
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      for (int i = 0; i < cards.length; i++) ...[
                        Dismissible(
                          key: Key(cards[i].id),
                          direction: DismissDirection.endToStart,
                          onDismissed: (direction) {
                            cardService.removeCard(cards[i].id);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: const Text('Карта удалена'),
                                backgroundColor: AppColors.textcolor2,
                                behavior: SnackBarBehavior.floating,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    AppRadius.sm,
                                  ),
                                ),
                              ),
                            );
                          },
                          background: Container(
                            alignment: Alignment.centerRight,
                            padding: const EdgeInsets.only(right: 24),
                            decoration: BoxDecoration(
                              color: AppColors.iosRed,
                              borderRadius: BorderRadius.circular(AppRadius.lg),
                            ),
                            child: const Icon(
                              Icons.delete_rounded,
                              color: Colors.white,
                            ),
                          ),
                          child: CreditCardWidget(
                            card: cards[i],
                            onTap: () => _showEditDialog(context, cards[i]),
                          ),
                        ),
                        if (i < cards.length - 1) const SizedBox(height: 14),
                      ],
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                // Кнопка "Добавить"
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: GestureDetector(
                    onTap: () => _showAddDialog(context),
                    child: Container(
                      width: double.infinity,
                      height: 56,
                      decoration: BoxDecoration(
                        color: AppColors.cardBackground,
                        borderRadius: BorderRadius.circular(AppRadius.lg),
                        border: Border.all(
                          color: AppColors.iosGray5,
                          width: 1.5,
                        ),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add_rounded,
                            color: AppColors.iosBlue,
                            size: 24,
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Добавить карту',
                            style: TextStyle(
                              color: AppColors.iosBlue,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  void _showAddDialog(BuildContext context) {
    final numberController = TextEditingController();
    final nameController = TextEditingController();
    final expiryController = TextEditingController();
    final bankController = TextEditingController();
    final cvvController = TextEditingController();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.cardBackground,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(AppRadius.xl)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            top: 24,
            bottom: MediaQuery.of(context).viewInsets.bottom + 24,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Заголовок
              const Text(
                'Новая карта',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textcolor2,
                ),
              ),
              const SizedBox(height: 20),
              _buildField(
                controller: bankController,
                label: 'Название карты',
                hint: 'Mbank',
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 16),
              // Номер карты
              _buildField(
                controller: numberController,
                label: 'Номер карты',
                hint: '0000 0000 0000 0000',
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16),

              // Имя владельца
              _buildField(
                keyboardType: TextInputType.text,
                controller: nameController,
                label: 'Имя владельца',
                hint: 'IVAN IVANOV',
              ),
              const SizedBox(height: 16),

              // Срок + Банк
              Row(
                children: [
                  Expanded(
                    child: _buildField(
                      controller: expiryController,
                      label: 'Срок',
                      hint: 'ММ/ГГ',
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildField(
                      keyboardType: TextInputType.number,
                      controller: cvvController,
                      label: 'CVV',
                      hint: 'XXX',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Кнопка
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: () {
                    if (numberController.text.length >= 4 &&
                        nameController.text.isNotEmpty &&
                        expiryController.text.isNotEmpty) {
                      context.read<CardService>().addCard(
                        BankCard(
                          id: 'card_${DateTime.now().millisecondsSinceEpoch}',
                          cardNumber: numberController.text.replaceAll(' ', ''),
                          cardHolder: nameController.text.toUpperCase(),
                          expiryDate: expiryController.text,
                          bankName: bankController.text.isEmpty
                              ? 'Банк'
                              : bankController.text,
                        ),
                      );
                      Navigator.pop(context);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.iosBlue,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppRadius.md),
                    ),
                  ),
                  child: const Text(
                    'Добавить',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showEditDialog(BuildContext context, BankCard card) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.cardBackground,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(AppRadius.xl)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                card.bankName,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textcolor2,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '•••• ${card.last4Digits}',
                style: const TextStyle(fontSize: 16, color: AppColors.iosGray),
              ),
              const SizedBox(height: 24),

              // Сделать по умолчанию
              if (!card.isDefault)
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {
                      context.read<CardService>().setDefault(card.id);
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Сделать картой по умолчанию',
                      style: TextStyle(
                        color: AppColors.iosBlue,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),

              // Удалить
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
                    context.read<CardService>().removeCard(card.id);
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Удалить карту',
                    style: TextStyle(
                      color: AppColors.iosRed,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required TextInputType keyboardType,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 6),
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.textcolor2,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: AppColors.iosGray6,
            borderRadius: BorderRadius.circular(AppRadius.md),
          ),
          child: TextField(
            controller: controller,
            keyboardType: keyboardType,
            style: const TextStyle(fontSize: 16, color: AppColors.textcolor2),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: const TextStyle(color: AppColors.iosGray3),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 14,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
