import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../gen/fonts.gen.dart';

class AppThemes {
  static const Color _primaryColor = Color(0xff007AFF);
  static const Color _secondaryColor = Color(0xffF48231);
  static const Color _backgroundColor = Color(0xffFFFFFF);
  static const Color _surfaceColor = Color(0xff2B3990);
  static const Color _textPrimary = Color(0xff171717);
  static const Color _textSecondary = Color(0xff737373);
  static const Color _borderColor = Color(0xffE5E5E5);
  static const Color _errorColor = Color(0xffEC362A);
  static const Color _primaryContainer = Color(0xffF5F5F6);
  static const int borderRadius = 24;

  static ThemeData get lightTheme => ThemeData(
    primaryColor: _primaryColor,
    scaffoldBackgroundColor: _backgroundColor,
    textTheme: textLightTheme,
    hoverColor: _borderColor,
    fontFamily: FontFamily.uRWDINArabic,
    hintColor: _textSecondary,
    primaryColorLight: _backgroundColor,
    primaryColorDark: _textPrimary,
    disabledColor: _textSecondary,
    dividerTheme: DividerThemeData(color: _borderColor),

    // dividerColor: Colors.grey.shade200,
    appBarTheme: AppBarTheme(
      backgroundColor: _primaryColor,
      elevation: 0,
      centerTitle: true,
      surfaceTintColor: _backgroundColor,
      iconTheme: IconThemeData(color: _backgroundColor),
      titleTextStyle: const TextStyle(
        color: Colors.white,
        fontSize: 24,
        fontFamily: FontFamily.uRWDINArabic,
        fontWeight: FontWeight.w700,
      ),
    ),
    colorScheme: ColorScheme.light(
      primary: _primaryColor,
      onPrimary: _backgroundColor,
      error: _errorColor,
      secondary: _secondaryColor,
      onSecondary: _textPrimary,
      surface: _surfaceColor,
      onSurface: _backgroundColor,
      primaryContainer: _primaryContainer,
    ),
    radioTheme: RadioThemeData(
      fillColor: WidgetStateProperty.resolveWith<Color>((states) {
        if (states.contains(WidgetState.selected)) {
          return Colors.blue; // selected color
        }
        return Colors.grey; // unselected color
      }),
    ),
    checkboxTheme: CheckboxThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.r)),
      fillColor: WidgetStateColor.resolveWith((Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return _primaryColor;
        }
        return Colors.transparent;
      }),
      side: BorderSide(color: _borderColor),
    ),
    navigationBarTheme: NavigationBarThemeData(
      // backgroundColor: _primaryLightColor,
      labelTextStyle: WidgetStateProperty.resolveWith((
        Set<WidgetState> states,
      ) {
        if (states.contains(WidgetState.selected)) {
          return TextStyle(
            color: _primaryColor,
            fontSize: 12,
            fontWeight: FontWeight.w700,
          );
        } else {
          return TextStyle(
            color: _textSecondary,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          );
        }
      }),
    ),
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
      hintStyle: TextStyle(
        fontSize: 13,
        color: _textSecondary,
        fontWeight: FontWeight.w500,
      ),
      fillColor: _backgroundColor,
      filled: true,

      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: _errorColor),
        borderRadius: BorderRadius.circular(borderRadius.r),
      ),

      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: _borderColor),
        borderRadius: BorderRadius.circular(borderRadius.r),
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: _borderColor),
        borderRadius: BorderRadius.circular(borderRadius.r),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: _primaryColor),
        borderRadius: BorderRadius.circular(borderRadius.r),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: _borderColor),
        borderRadius: BorderRadius.circular(borderRadius.r),
      ),
      contentPadding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
    ),
    // navigationBarTheme: NavigationBarThemeData(
    //   backgroundColor: _primaryLightColor,
    //   labelTextStyle: WidgetStatePropertyAll(
    //     TextStyle(
    //       color: _hintColor,
    //       fontSize: 14,
    //       fontWeight: FontWeight.w500,
    //     ),
    //   ),
    // ),
    expansionTileTheme: ExpansionTileThemeData(
      collapsedShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
        side: BorderSide(color: _borderColor),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
        side: BorderSide(color: _borderColor),
      ),
    ),
    tabBarTheme: TabBarThemeData(
      dividerColor: Color(0xFFE0E0E0), // اللون اللي عايزه
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: _backgroundColor,
      selectedItemColor: _primaryColor,
      unselectedItemColor: _textSecondary,
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: const TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w500,
      ),
      unselectedLabelStyle: const TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w500,
      ),
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: _backgroundColor,
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius.r),
        borderSide: BorderSide.none,
      ),
    ),
  );

  static TextTheme get textLightTheme => const TextTheme(
    labelLarge: TextStyle(
      color: _textPrimary,
      fontSize: 14,
      fontWeight: FontWeight.w700,
      fontFamily: FontFamily.uRWDINArabic,
    ),
    headlineMedium: TextStyle(
      color: _textPrimary,
      fontSize: 14,
      fontWeight: FontWeight.w600,
      fontFamily: FontFamily.uRWDINArabic,
    ),
    labelMedium: TextStyle(
      color: _textPrimary,
      fontSize: 14,
      fontWeight: FontWeight.w500,
      fontFamily: FontFamily.uRWDINArabic,
    ),
    headlineSmall: TextStyle(
      color: _textPrimary,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      fontFamily: FontFamily.uRWDINArabic,
    ),
    labelSmall: TextStyle(
      color: _textSecondary,
      fontSize: 14,
      fontWeight: FontWeight.w300,
      fontFamily: FontFamily.uRWDINArabic,
    ),
  );
}
