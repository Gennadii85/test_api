import 'dart:math';
import 'package:flutter/material.dart';

class ColorGenerateService {
  static Color generateRandomColor() {
    final Random random = Random();
    return Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
    // цвет фона будет случайным из 16 777 216 возможных комбинаций
  }
}
