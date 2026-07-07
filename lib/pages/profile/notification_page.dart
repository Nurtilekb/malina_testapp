import 'package:flutter/material.dart';
import 'package:malina/core/theme.dart';
import 'package:malina/widgets/notification_carts.dart';

class NiotificationPage extends StatefulWidget {
  const NiotificationPage({super.key});

  @override
  State<NiotificationPage> createState() => _NiotificationPageState();
}

class _NiotificationPageState extends State<NiotificationPage> {
  bool _allNotif = true;
  bool _orderNotif = false;
  bool _emailNotif = false;
  bool _generalNotif = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Уведомления',
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
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),

              // Секция: Уведомления
              _buildSectionHeader('Настройки уведомлений'),

              NotifCarts(
                value: _allNotif,
                onChanged: (value) => setState(() => _allNotif = value),
                maintext: 'Разрешить уведомления',
                descriptiontext: 'Получать push-уведомления от приложения',
              ),
              NotifCarts(
                value: _orderNotif,
                onChanged: (value) => setState(() => _orderNotif = value),
                maintext: 'Email уведомления',
                descriptiontext: 'Письма с акциями, скидками и предложениями',
              ),
              NotifCarts(
                value: _emailNotif,
                onChanged: (value) => setState(() => _emailNotif = value),
                maintext: 'Уведомления о заказах',
                descriptiontext: 'Статусы заказов и информация о доставке',
              ),
              NotifCarts(
                value: _generalNotif,
                onChanged: (value) => setState(() => _generalNotif = value),
                maintext: 'Общие уведомления',
                descriptiontext: 'Системные уведомления и новости приложения',
              ),
              Spacer(),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.iosBlue,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppRadius.md),
                    ),
                  ),
                  child: const Text(
                    'Сохранить настройки',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
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
}
