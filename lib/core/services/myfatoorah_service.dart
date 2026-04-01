import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:madar_24/core/services/server_gate.dart';
import 'package:madar_24/core/utils/app_const.dart';
import 'package:myfatoorah_flutter/myfatoorah_flutter.dart';

import '../utils/enums.dart';

class MyfatoorahService {
  // final String mAPIKeyTest = "SK_KWT_vVZlnnAqu8jRByOWaRPNId4ShzEDNt256dvnjebuyzo52dXjAfRx2ixW5umjWSUx";
  String mfEnvironment = MFEnvironment.TEST;
  List<MFPaymentMethod> paymentMethods = [];
  ValueNotifier<RequestState> methodLoading = ValueNotifier(
    RequestState.initial,
  );
  String? errorMsg;
  Future<void> initiatePayment(double amount) async {
    try {
      if (paymentMethods.isNotEmpty) return;
      methodLoading.value = RequestState.loading;
      // MFSDK.init(mAPIKeyTest, MFCountry.KUWAIT, mfEnvironment);

      // final request = MFInitiatePaymentRequest(invoiceAmount: amount, currencyIso: MFCurrencyISO.UAE_AED);
      // final result = await MFSDK.initiatePayment(request, MFLanguage.ENGLISH);
      final result = await ServerGate.i.getFromServer(
        url: APIconst.methodsMyfatoorah,
      );
      paymentMethods = List<MFPaymentMethod>.from(
        (result.data?['data']?['payment_methods'] ?? []).map(
          (x) => MFPaymentMethod.fromJson(x),
        ),
      );
      log(jsonEncode({"data": paymentMethods.map((e) => e.toJson()).toList()}));
      methodLoading.value = RequestState.done;
    } on MFError catch (e) {
      errorMsg = e.message.toString();
      methodLoading.value = RequestState.error;
    } catch (e) {
      errorMsg = e.toString();
    }
  }

  // Future<void> checkout(int? paymentMethodId, double amount) async {
  //   try {
  //     MFExecutePaymentRequest request = MFExecutePaymentRequest(invoiceValue: 10);
  //     request.paymentMethodId = 1;
  //     request.displayCurrencyIso = MFCurrencyISO.UAE_AED;
  //     final result = await MFSDK.executePayment(request, MFLanguage.ENGLISH, (v) {});
  //     // result
  //   } on MFError catch (e) {
  //     FlashHelper.showToast(e.message.toString());
  //   } catch (e) {
  //     FlashHelper.showToast(e.toString());
  //   }
  // }
}
