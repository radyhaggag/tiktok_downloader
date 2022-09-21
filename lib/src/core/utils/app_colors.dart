import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Color(0xFF7ED086);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color blackWithOpacity = Color(0x80000000);
  static const Color opacityLayerColor = Color(0xFFD9D9D9);
  static const Color error = Color(0xFFFD1111);
  static const Color light = Color(0xFFF6F6F6);
  static const Color grey = Color(0xFFD9D9D9);
  static LinearGradient splashGradient = const LinearGradient(
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
    colors: [Color(0xFF1f4037), Color(0xFF99f2c8)],
  );
}
