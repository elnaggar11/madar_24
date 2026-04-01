import 'package:flutter/material.dart';
import 'package:madar_24/features/splash/view/splash_view.dart';

import 'routes.dart';

class AppRoutes {
  static AppRoutes get init => AppRoutes._internal();
  String initial = NamedRoutes.splash;

  AppRoutes._internal();

  Map<String, Widget Function(BuildContext)> appRoutes = {
    NamedRoutes.splash: (c) => const SplashView(),
    // NamedRoutes.onBoarding: (c) => const OnBoardingView(),
    // NamedRoutes.login: (c) => const LoginView(),
    // NamedRoutes.forgotPassword: (c) => const ForgetPasswordView(),
    // NamedRoutes.resetPassword: (c) => const ResetPasswordView(),
    // NamedRoutes.register: (c) => const RegisterView(),
    // NamedRoutes.verifyPhone: (c) => VerifyPhoneView(),
    // // NamedRoutes.resetPassword: (c) => ResetPasswordView(phone: c.arg['phone'], otp: c.arg['otp']),
    // NamedRoutes.createService: (c) => const CreateServiceView(),
    // NamedRoutes.layout: (c) => const LayoutView(),
    // NamedRoutes.editProfile: (c) => const EditProfileView(),
    // NamedRoutes.appPages: (c) =>
    //     AppPageView(type: (c.arg['type'] as AppPageType?) ?? AppPageType.about),
  };
}
