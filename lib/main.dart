import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madar_24/core/routes/app_routes.dart';
import 'package:madar_24/core/routes/app_routes_fun.dart';
import 'package:madar_24/core/services/bloc_observer.dart';
import 'package:madar_24/core/services/service_locator.dart';
import 'package:madar_24/core/utils/app_theme.dart';
import 'package:madar_24/core/utils/phoneix.dart';
import 'package:madar_24/core/utils/unfucs.dart';
import 'package:madar_24/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await EasyLocalization.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  Bloc.observer = AppBlocObserver();
  prefs = await SharedPreferences.getInstance();
  ServicesLocator().init();
  UserModel.i.get();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      path: 'assets/translations',
      saveLocale: true,
      startLocale: const Locale('ar', 'EG'),
      fallbackLocale: const Locale('en', 'US'),
      supportedLocales: const [Locale('ar', 'EG'), Locale('en', 'US')],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            themeMode: ThemeMode.light,
            initialRoute: AppRoutes.init.initial,
            routes: AppRoutes.init.appRoutes,
            navigatorKey: navigator,
            debugShowCheckedModeBanner: false,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            theme: AppThemes.lightTheme,
            builder: (context, child) {
              ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
                return Scaffold(
                  appBar: AppBar(elevation: 0, backgroundColor: Colors.white),
                );
              };
              return Phoenix(
                child: MediaQuery(
                  data: MediaQuery.of(
                    context,
                  ).copyWith(textScaler: TextScaler.linear(1.sp)),
                  child: Unfocus(child: child ?? const SizedBox.shrink()),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

late SharedPreferences prefs;

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (cert, host, port) => true;
  }
}
