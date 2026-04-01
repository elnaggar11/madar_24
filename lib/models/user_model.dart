import 'dart:convert';

import 'package:madar_24/models/country_model.dart';

import '../main.dart';
import 'base.dart';

class UserModel extends Model {
  static final UserModel i = UserModel._();
  UserModel._();

  late String name, email, phone, userType, locale, token;
  late bool isActive, isNotify;
  late String avatarPath;

  CountryModel? country;

  bool get isAuth => token.isNotEmpty;
  bool get isCompleteData => name.isNotEmpty;

  fromJson([Map<String, dynamic>? json]) {
    final data = json ?? {};
    id = stringFromJson(data, "id");
    name = stringFromJson(data, "full_name");
    phone = stringFromJson(data, "phone");
    email = stringFromJson(data, "email");
    userType = stringFromJson(data, "user_type");
    locale = stringFromJson(data, "locale");
    isActive = boolFromJson(data, "is_active");
    isNotify = boolFromJson(data, "is_notify");
    avatarPath = stringFromJson(data['avatar'], "path");
    token = stringFromJson(data, "token");
    country = data['country'] == null
        ? null
        : CountryModel.fromJson(data['country']);
  }

  save() {
    prefs.setString("user", jsonEncode(toJson()));
  }

  get() {
    fromJson(jsonDecode(prefs.getString("user") ?? "{}"));
  }

  clear() {
    prefs.remove("user");
    fromJson();
  }

  @override
  Map<String, dynamic> toJson() => {
    "id": id,
    "full_name": name,
    "phone": phone,
    "email": email,
    "user_type": userType,
    "locale": locale,
    "is_active": isActive,
    "is_notify": isNotify,
    "avatar": {"path": avatarPath},
    "token": token,
  };
}
