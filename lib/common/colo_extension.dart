import 'package:flutter/material.dart';

class TColor {
  static Color get primaryColor1 => const Color.fromARGB(255, 99, 108, 240);
  static Color get primaryColor2 => const Color.fromARGB(196, 93, 99, 187);
  static Color get primaryColor3 => const Color(0xFF1E236B);

  static Color get secondaryColor1 => const Color(0xffC58BF2);
  static Color get secondaryColor2 => const Color(0xffEEA4CE);
  static Color get primaryText => const Color(0xff221E3A);
  static Color get secondaryText => const Color(0xff707070);
  static Color get primary => const Color(0xffFF9B70);
  static Color get green => const Color(0xff77E517);

  static List<Color> get primaryG =>
      [primaryColor1, primaryColor2, primaryColor3]; // Tek renkli liste
  static List<Color> get secondaryG => [secondaryColor2, secondaryColor1];

  static Color get black => const Color(0xff1D1617);
  static Color get gray => const Color(0xff786F72);
  static Color get white => Colors.white;
  static Color get lightGray => const Color(0xffF7F8F8);
}
