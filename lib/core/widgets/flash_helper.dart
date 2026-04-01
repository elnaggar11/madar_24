import 'dart:ui';

import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/routes/app_routes_fun.dart';
import '../utils/extensions.dart';

enum MessageType { success, fail, warning }

class FlashHelper {
  static Future<void> showToast(String msg, {int duration = 2, MessageType type = MessageType.fail}) async {
    if (msg.isEmpty) return;
    final meta = _ToastMeta.from(type);
    final toastDuration = _calcDuration(msg, duration);

    return showFlash(
      context: navigator.currentContext!,
      builder: (context, controller) {
        return FlashBar(
          controller: controller,
          behavior: FlashBehavior.floating,
          position: FlashPosition.top,
          margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
          backgroundColor: Colors.transparent,
          elevation: 0,
          forwardAnimationCurve: Curves.easeOutBack,
          reverseAnimationCurve: Curves.easeIn,
          content: ClipRRect(
            borderRadius: BorderRadius.circular(14.r),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: meta.gradient, begin: Alignment.topLeft, end: Alignment.bottomRight),
                  borderRadius: BorderRadius.circular(14.r),
                  border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
                  boxShadow: [BoxShadow(color: meta.shadowColor, blurRadius: 18, offset: const Offset(0, 10), spreadRadius: -2)],
                ),
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _IconBadge(meta: meta),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            meta.title,
                            style: context.regularText.copyWith(fontSize: 15.sp, fontWeight: FontWeight.w700, color: Colors.white),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            msg,
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.start,
                            softWrap: true,
                            style: context.regularText.copyWith(fontSize: 14.sp, color: Colors.white.withValues(alpha: 0.92), height: 1.3),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 8.w),
                    GestureDetector(
                      onTap: controller.dismiss,
                      child: Container(
                        height: 28.w,
                        width: 28.w,
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.12),
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white.withValues(alpha: 0.2)),
                        ),
                        child: Icon(Icons.close_rounded, size: 16.sp, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      duration: Duration(seconds: toastDuration),
    );
  }
}

class _ToastMeta {
  const _ToastMeta({required this.title, required this.gradient, required this.color, required this.icon});

  final String title;
  final List<Color> gradient;
  final Color color;
  final IconData icon;

  Color get shadowColor => color.withValues(alpha: 0.35);
  Color get badgeBg => Colors.white.withValues(alpha: 0.16);

  factory _ToastMeta.from(MessageType type) {
    switch (type) {
      case MessageType.success:
        return _ToastMeta(title: 'تم بنجاح', gradient: ["#1F9D6E".color, "#3CCF8E".color], color: "#1F9D6E".color, icon: Icons.check_rounded);
      case MessageType.warning:
        return _ToastMeta(title: 'تنبيه', gradient: ["#FFB600".color, "#FFD36F".color], color: "#FFB600".color, icon: Icons.warning_amber_rounded);
      default:
        return _ToastMeta(title: 'حدث خطأ', gradient: ["#EF233C".color, "#F45B69".color], color: "#EF233C".color, icon: Icons.error_rounded);
    }
  }
}

class _IconBadge extends StatelessWidget {
  const _IconBadge({required this.meta});

  final _ToastMeta meta;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.w,
      width: 40.w,
      decoration: BoxDecoration(
        color: meta.badgeBg,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white.withValues(alpha: 0.2)),
      ),
      child: Center(
        child: Icon(meta.icon, size: 22.sp, color: Colors.white),
      ),
    );
  }
}

int _calcDuration(String msg, int baseSeconds) {
  final words = msg.trim().split(RegExp(r'\\s+')).length;
  // ~0.45s per word + buffer, clamped between 2s and 10s.
  final adaptive = (words * 0.45).ceil() + 1;
  final clamped = adaptive.clamp(2, 10);
  return clamped < baseSeconds ? baseSeconds : clamped;
}
