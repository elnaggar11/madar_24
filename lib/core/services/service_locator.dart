import 'package:get_it/get_it.dart';
import 'package:madar_24/features/auth/forget_password/cubit/forget_password_cubit.dart';
import 'package:madar_24/features/auth/verify/cubit/verify_cubit.dart';
import 'package:madar_24/features/layout/cubit/layout_cubit.dart';
import 'package:madar_24/features/splash/cubit/splash_cubit.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    sl.registerFactory(() => SplashCubit());
    sl.registerFactory(() => ForgetPasswordCubit());
    // sl.registerFactory(() => LoginCubit());
    sl.registerFactory(() => VerifyCubit());
    sl.registerFactory(() => LayoutCubit());
  }
}
