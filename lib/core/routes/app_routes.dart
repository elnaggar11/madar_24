import 'package:flutter/material.dart';
import 'package:madar_24/features/auth/forget_password/view/confirm_identity.dart';
import 'package:madar_24/features/auth/forget_password/view/reset_password.dart';
import 'package:madar_24/features/auth/login/view/login_view.dart';
import 'package:madar_24/features/auth/sign_up/view/sign_up_view.dart';
import 'package:madar_24/features/auth/verify/view/view.dart';
import 'package:madar_24/features/splash/view/splash_view.dart';

import 'routes.dart';

class AppRoutes {
  static AppRoutes get init => AppRoutes._internal();
  String initial = NamedRoutes.splash;

  AppRoutes._internal();

  Map<String, Widget Function(BuildContext)> appRoutes = {
    NamedRoutes.splash: (c) => const SplashView(),
    NamedRoutes.confirmIdentity: (c) => const ConfirmIdentityView(),
    NamedRoutes.login: (c) => const LoginView(),
    NamedRoutes.resetPassword: (c) => const ResetPasswordView(),
    NamedRoutes.register: (c) => const SignUpView(),
    NamedRoutes.verify: (c) => VerifyView(),
  };
}
