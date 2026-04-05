import 'package:madar_24/core/utils/enums.dart';

class SplashState {
  final RequestState requestState;
  SplashState({this.requestState = RequestState.initial});
  SplashState copyWith({RequestState? requestState}) {
    return SplashState(requestState: requestState ?? this.requestState);
  }
}
