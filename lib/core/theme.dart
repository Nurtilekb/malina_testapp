import 'package:flutter/material.dart';

abstract class AppColors {
  // Фоны
  static const backround1 = Color(0xFFFFFFFF);
  static const backround2 = Color(0xFFF2F2F7); // iOS systemGroupedBackground
  static const backround3 = Color(
    0xFFFFFFFF,
  ); // iOS secondarySystemGroupedBackground
  static const linkcolor = Color(0xFF007AFF); // iOS systemBlue
  static const textcolor1 = Color(0xFF8E8E93); // iOS systemGray
  static const bordercolor = Color(0xFFE5E5EA); // iOS separator
  static const primarycolor = Color(0xFFFAEDC8);
  static const primarydarkcolor = Color(0xFF34C759); // iOS systemGreen
  static const primarylightcolor = Color(0xFFEBFFD7);
  static const textcolor2 = Color(0xFF000000);

  // iOS-палитра
  static const iosBlue = Color(0xFF007AFF);
  static const iosGreen = Color(0xFF34C759);
  static const iosRed = Color(0xFFFF3B30);
  static const iosOrange = Color(0xFFFF9500);
  static const iosPurple = Color(0xFFAF52DE);
  static const iosPink = Color(0xFFFF2D55);
  static const iosTeal = Color(0xFF30B0C7);
  static const iosIndigo = Color(0xFF5856D6);
  static const iosGray = Color(0xFF8E8E93);
  static const iosGray2 = Color(0xFFAEAEB2);
  static const iosGray3 = Color(0xFFC7C7CC);
  static const iosGray4 = Color(0xFFD1D1D6);
  static const iosGray5 = Color(0xFFE5E5EA);
  static const iosGray6 = Color(0xFFF2F2F7);

  // Карточка
  static const cardBackground = Color(0xFFFFFFFF);
  static const cardShadow = Color(0x1A000000);
}

abstract class AppRadius {
  static const double xs = 8;
  static const double sm = 12;
  static const double md = 16;
  static const double lg = 20;
  static const double xl = 24;
  static const double xxl = 28;
  static const double pill = 100;
}

abstract class AppShadows {
  static List<BoxShadow> card = [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.04),
      blurRadius: 16,
      offset: const Offset(0, 2),
    ),
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.02),
      blurRadius: 4,
      offset: const Offset(0, 1),
    ),
  ];

  static List<BoxShadow> floating = [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.08),
      blurRadius: 24,
      offset: const Offset(0, 8),
    ),
  ];

  static List<BoxShadow> soft = [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.03),
      blurRadius: 10,
      offset: const Offset(0, 2),
    ),
  ];
}
