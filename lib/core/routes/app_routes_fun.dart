import 'package:flutter/material.dart';

Future<dynamic> push(String named, {Map<String, dynamic>? arg}) {
  return Navigator.of(navigator.currentContext!).pushNamed(named, arguments: arg);
}

Future<dynamic> replacement(String named, {Map<String, dynamic>? arg}) {
  return Navigator.of(navigator.currentContext!).pushReplacementNamed(named, arguments: arg);
}

Future<dynamic> pushAndRemoveUntil(String named, {Map<String, dynamic>? arg, String? untilPage}) {
  return Navigator.of(
    navigator.currentContext!,
  ).pushNamedAndRemoveUntil(named, (route) => untilPage == null ? false : untilPage == route.settings.name, arguments: arg);
}

final GlobalKey<NavigatorState> navigator = GlobalKey<NavigatorState>();
