import 'dart:async';
import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madar_24/gen/locale_keys.g.dart';

extension ExtensionContext on BuildContext {
  double get h => MediaQuery.of(this).size.height;

  double get w => MediaQuery.of(this).size.width;

  ThemeData? get theme => Theme.of(this);

  TextStyle get boldText =>
      Theme.of(this).textTheme.labelLarge ?? const TextStyle();

  TextStyle get lightText =>
      Theme.of(this).textTheme.labelSmall ?? const TextStyle();

  TextStyle get mediumText =>
      Theme.of(this).textTheme.labelMedium ?? const TextStyle();

  TextStyle get regularText =>
      Theme.of(this).textTheme.headlineSmall ?? const TextStyle();

  TextStyle get semiboldText =>
      Theme.of(this).textTheme.headlineMedium ?? const TextStyle();

  Color get primaryColor => Theme.of(this).primaryColor;

  Color get highlightColor => Theme.of(this).highlightColor;

  Color get focusColor => Theme.of(this).focusColor;

  Color get splashColor => Theme.of(this).splashColor;

  Color get surfaceColor => Theme.of(this).colorScheme.surface;

  Color get primaryContainer => Theme.of(this).colorScheme.primaryContainer;

  Color get textPrimaryColor => Theme.of(this).primaryColorDark;

  Color get textSecondaryColor => Theme.of(this).hintColor;

  Color get borderColor =>
      Theme.of(this).dividerTheme.color ?? Theme.of(this).dividerColor;

  Color get disabledColor => Theme.of(this).disabledColor;

  Color get hoverColor => Theme.of(this).hoverColor;

  Color get canvasColor => Theme.of(this).canvasColor;

  Color get hintColor => Theme.of(this).hintColor;

  Color get cardColor => Theme.of(this).cardColor;

  Color get errorColor => Theme.of(this).colorScheme.error;

  Color get primaryColorLight => Theme.of(this).primaryColorLight;

  Color get primaryColorDark => Theme.of(this).primaryColorDark;

  Color get secondaryColor => Theme.of(this).colorScheme.secondary;

  Color get scaffoldBackgroundColor => Theme.of(this).scaffoldBackgroundColor;

  String get currentRoute => ModalRoute.of(this)?.settings.name ?? "";

  BoxDecoration get primaryDecoration => BoxDecoration(
    borderRadius: BorderRadius.circular(10.r),
    color: primaryColor,
    border: Border.all(color: borderColor),
  );

  List<BoxShadow> get primaryBoxShadow => [
    BoxShadow(
      color: '#0000000F'.color.withValues(alpha: 0.06),
      blurRadius: 8,
      offset: const Offset(0, 4),
    ),
    BoxShadow(
      color: '#0000000F'.color.withValues(alpha: 0.04),
      blurRadius: 4,
      offset: const Offset(0, 0),
    ),
  ];

  Map<dynamic, dynamic> get arg =>
      (ModalRoute.of(this)?.settings.arguments ?? {}) as Map<dynamic, dynamic>;

  double get availableHeight => MediaQuery.of(this).viewInsets.bottom;
}

extension StringContext on String {
  bool get isArabic {
    final arabicRegex = RegExp(r'[\u0600-\u06FF\u0750-\u077F\u08A0-\u08FF]');
    return arabicRegex.hasMatch(this);
  }

  Color get color {
    String colorStr = trim();
    if (colorStr.length == 7) colorStr = "FF$colorStr";
    colorStr = colorStr.replaceAll("#", "");
    int val = 0;
    int len = colorStr.length;
    for (int i = 0; i < len; i++) {
      int hexDigit = colorStr.codeUnitAt(i);
      if (hexDigit >= 48 && hexDigit <= 57) {
        val += (hexDigit - 48) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 65 && hexDigit <= 70) {
        val += (hexDigit - 55) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 97 && hexDigit <= 102) {
        val += (hexDigit - 87) * (1 << (4 * (len - 1 - i)));
      } else {
        throw const FormatException(
          "An error occurred when converting a color",
        );
      }
    }
    return Color(val);
  }
}

extension EnglishToArabicConversion on String {
  String get toUpper {
    return split(' ')
        .map(
          (word) => word.isNotEmpty
              ? '${word[0].toUpperCase()}${word.substring(1).toLowerCase()}'
              : word,
        )
        .join(' ');
  }

  String get toArabicNumber {
    // Create a mapping of English to Arabic numerals
    final englishToArabicMap = {
      '0': '٠',
      '1': '١',
      '2': '٢',
      '3': '٣',
      '4': '٤',
      '5': '٥',
      '6': '٦',
      '7': '٧',
      '8': '٨',
      '9': '٩',
    };

    // Iterate through the characters of the English input and replace with Arabic numerals
    return split('').map((char) {
      return englishToArabicMap[char] ?? char;
    }).join();
  }
}

extension ExtensionWidget on Widget {
  Widget get center => Align(alignment: Alignment.center, child: this);

  Widget withPadding({
    double all = 0.0,
    double vertical = 0.0,
    double horizontal = 0.0,
    double top = 0.0,
    double bottom = 0.0,
    double start = 0.0,
    double end = 0.0,
  }) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
        top: all + vertical + top,
        bottom: all + vertical + bottom,
        start: all + horizontal + start,
        end: all + horizontal + end,
      ),
      child: this,
    );
  }

  Widget get toEnd =>
      Align(alignment: AlignmentDirectional.centerEnd, child: this);

  Widget get toStart =>
      Align(alignment: AlignmentDirectional.centerStart, child: this);

  Widget get toBottom => Align(alignment: Alignment.bottomCenter, child: this);

  Widget get toBottomEnd =>
      Align(alignment: AlignmentDirectional.bottomEnd, child: this);

  Widget get toBottomStart =>
      Align(alignment: AlignmentDirectional.bottomStart, child: this);

  Widget get toTopEnd =>
      Align(alignment: AlignmentDirectional.topEnd, child: this);

  Widget get toTopStart =>
      Align(alignment: AlignmentDirectional.topStart, child: this);

  Widget get toTop => Align(alignment: Alignment.topCenter, child: this);
}

extension ExtensionInt on int {
  Duration get seconds => Duration(seconds: this);

  Duration get milliseconds => Duration(milliseconds: this);

  Duration get days => Duration(days: this);

  Duration get hours => Duration(hours: this);

  Duration get months => Duration(days: this * 30);

  Duration get years => Duration(days: this * 365);

  Duration get minutes => Duration(minutes: this);

  LinearGradient get generateGradientColor {
    // Seed the random number generator with the given ID
    final random = Random(this);

    // Generate the first random color
    final color1 = Color.fromARGB(
      255, // Full opacity
      random.nextInt(256), // Red
      random.nextInt(256), // Green
      random.nextInt(256), // Blue
    );

    // Generate the second random color
    final color2 = Color.fromARGB(
      255, // Full opacity
      random.nextInt(256), // Red
      random.nextInt(256), // Green
      random.nextInt(256), // Blue
    );

    // Return a linear gradient with the two generated colors
    return LinearGradient(
      colors: [color1, color2],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
  }
}

extension ScrollControllerExtension on PageController {
  Stream<PageController> get stream {
    final stream = StreamController<PageController>.broadcast();
    addListener(() {
      stream.add(this);
    });
    return stream.stream;
  }
}

extension ExtensionDateTime on DateTime {
  bool isSameDate(DateTime? other) {
    if (other == null) return false;
    return year == other.year && month == other.month && day == other.day;
  }

  bool isSameDateTime(DateTime other) {
    return year == other.year &&
        month == other.month &&
        day == other.day &&
        hour == other.hour &&
        minute == other.minute;
  }

  bool isSameTime(DateTime other) {
    return hour == other.hour && minute == other.minute;
  }

  String get formatDuration {
    DateTime now = DateTime.now();
    Duration duration = now.difference(this);
    if (duration.inDays > 3) {
      // Format the date and time as "July 1, 2023 at 12:00 PM"
      return DateFormat('MMMM d, y').format(this);
    } else if (LocaleKeys.lang.tr() == 'en') {
      if (duration.inDays >= 1) {
        return '${duration.inDays} d';
      } else if (duration.inHours >= 1) {
        return '${duration.inHours} h';
      } else if (duration.inMinutes >= 1) {
        return '${duration.inMinutes} m';
      } else {
        return '${duration.inSeconds} s';
      }
    } else {
      if (duration.inDays >= 1) {
        return 'منذ ${duration.inDays} يوم';
      } else if (duration.inHours >= 1) {
        return 'منذ ${duration.inHours} ساعة';
      } else if (duration.inMinutes >= 1) {
        return 'منذ ${duration.inMinutes} دقيقة';
      } else {
        return '';
      }
    }
  }
}

extension ExtensionGlobalKeys on GlobalKey<FormState> {
  bool get isValid => currentState?.validate() ?? false;
}

extension ExtensionList on List {
  indexOrNull(int index) {
    if (index >= 0 && index < length) {
      return this[index];
    } else {
      return null;
    }
  }
}
