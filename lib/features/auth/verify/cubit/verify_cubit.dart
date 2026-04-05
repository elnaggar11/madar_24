import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'verify_state.dart';

class VerifyCubit extends Cubit<VerifyState> {
  VerifyCubit() : super(VerifyInitial());

  String maskPhone(String phone) {
    if (phone.length <= 2) return phone;
    String lastTwo = phone.substring(phone.length - 2);
    int maskedLength = phone.length - 2;
    String stars = '*' * maskedLength;
    List<String> chunks = [];
    for (int i = 0; i < stars.length; i += 3) {
      int end = (i + 3 < stars.length) ? i + 3 : stars.length;
      chunks.add(stars.substring(i, end));
    }
    return '${chunks.join(' ')}$lastTwo';
  }
}
