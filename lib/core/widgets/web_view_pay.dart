import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../utils/extensions.dart';
import 'back_widget.dart';
import 'flash_helper.dart';
import '../../gen/locale_keys.g.dart';

class WebViewPay extends StatefulWidget {
  final String url;

  const WebViewPay({super.key, required this.url});

  @override
  State<WebViewPay> createState() => _WebViewPayState();
}

class _WebViewPayState extends State<WebViewPay> {
  late final WebViewController _controller;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.white)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (v) {
            log('-=-= onPageStarted  -=-= $v');
            final data = Uri.parse(v).queryParameters;
            // https://saqya-almasajid.sharqawi.aait-d.com/api/payment/callback?status=success&transaction_id=txn_01KH6BFY3QJ64QY0NSACC2NZFB&paymentId=07076511616331843872&Id=07076511616331843872
            if (data.containsKey('status') && data['status'] == 'success') {
              Navigator.pop(context);
              return;
            }
            setState(() => _isLoading = true);
          },
          onPageFinished: (v) {
            log('-=-= onPageFinished  -=-= $v');
            setState(() => _isLoading = false);
          },
          onWebResourceError: (error) => FlashHelper.showToast(error.description),
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: LocaleKeys.checkout.tr()),
      body: Stack(
        children: [
          WebViewWidget(controller: _controller),
          if (_isLoading)
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: LinearProgressIndicator(minHeight: 2.h, backgroundColor: context.borderColor.withValues(alpha: 0.4), color: context.primaryColor),
            ),
        ],
      ),
    );
  }
}
