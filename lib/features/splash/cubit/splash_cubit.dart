import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madar_24/core/routes/app_routes_fun.dart';
import 'package:madar_24/core/routes/routes.dart';
import 'package:madar_24/core/utils/enums.dart';
import 'package:madar_24/core/utils/extensions.dart';
import 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashState());
  Future<void> start() async {
    emit(state.copyWith(requestState: RequestState.loading));
    await Future.delayed(2.seconds, () {
      pushAndRemoveUntil(NamedRoutes.login);
    });
  }
}
