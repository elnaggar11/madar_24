import 'package:flutter/material.dart';
import 'package:madar_24/core/services/service_locator.dart';
import 'package:madar_24/core/widgets/custom_image.dart';
import 'package:madar_24/features/splash/cubit/splash_cubit.dart';
import 'package:madar_24/gen/assets.gen.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  late final SplashCubit cubit;
  @override
  void initState() {
    super.initState();
    cubit = sl<SplashCubit>()..start();
  }

  @override
  void dispose() {
    cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: CustomImage(Assets.icons.splashLogo)));
  }
}
