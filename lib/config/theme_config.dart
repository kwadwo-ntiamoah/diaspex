import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();

  static ThemeData defaultTheme = ThemeData(
      primaryColor: AppColors.primary,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        brightness: Brightness.dark,
        primary: AppColors.primary,
      ),
      textTheme: GoogleFonts.poppinsTextTheme(_textTheme),
      inputDecorationTheme: _inputTheme,
      useMaterial3: true);

  static final TextTheme _textTheme = TextTheme(
      displayLarge: TextStyle(
          fontSize: 30, fontWeight: FontWeight.bold, color: AppColors.textDark),
      displayMedium: TextStyle(
          fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.textDark),
      bodyLarge: TextStyle(
          fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.textDark),
      bodyMedium: TextStyle(fontSize: 16, color: AppColors.textDark),
      bodySmall: TextStyle(fontSize: 14, color: AppColors.textDark),
      titleMedium: TextStyle(fontSize: 10, color: AppColors.textGray));

  static final InputBorder _inputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: AppColors.borderDefault, width: 1));

  static final InputDecorationTheme _inputTheme = InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      enabledBorder: _inputBorder,
      focusedBorder: _inputBorder.copyWith(
          borderSide: BorderSide(color: AppColors.borderPrimary)),
      errorBorder: _inputBorder.copyWith(
          borderSide: BorderSide(color: AppColors.textDanger)));
}

class AppColors {
  AppColors._();

  // basic
  static Color transparent = Colors.transparent;
  static Color white = Colors.white;
  static Color primary = const Color(0xFF063A57);
  static Color btnPrimary = const Color(0xFF0094FF);
  static Color btnSecondary = const Color(0xFFF1F5F9);
  static Color btnDisabled = const Color(0xFFCFDAE3);
  static Color error = Colors.red;

  // borders
  static Color borderDefault = const Color(0XFFC2C2C2);
  static Color borderPrimary = const Color(0XFFA0D7FF);
  static Color borderLight = const Color(0XFFECF4FB);

  // Material Color
  static Map<int, Color> swatch = {1: primary};
  static MaterialColor primaryMaterial = MaterialColor(1, swatch);

  // fonts
  static Color textDanger = const Color(0x000ffff0);
  static Color textDark = const Color(0xFF111111);
  static Color textGray = const Color(0xFF828282);

  // icons
  static Color iconDark = const Color(0xFF707070);
  static Color dividerColor = const Color(0XFFEAEBEC);

  // backgrounds
  static Color bgLight = const Color(0xFFFAFDFF);
  static Color bgGray = const Color(0xFFEFEFEF);
  static Color bgGray2 = const Color(0xFFF7F7F7);
  static Color bgGray3 = const Color(0xFFE7E7E7);
  static Color bgGray4 = const Color(0xFFF1F5F9);
  static Color bgGraySecondary = const Color(0XFFEBEBEB);
  static Color bgDangerLight = const Color(0xFFFFEFEF);
  static Color bgPrimaryLight = const Color(0xFFE7F5FF);
  static Color bgPrimaryLight2 = const Color(0xFFE5EFF2);
}
