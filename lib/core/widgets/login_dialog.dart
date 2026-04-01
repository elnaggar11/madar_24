import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../gen/locale_keys.g.dart';
import '../routes/app_routes_fun.dart';
import '../routes/routes.dart';
import '../utils/extensions.dart';
import 'app_btn.dart';

class LoginDialog extends StatelessWidget {
  final Function? callBack;
  final String? lastPage;
  const LoginDialog({super.key, this.callBack, this.lastPage});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(LocaleKeys.login.tr(), style: context.boldText.copyWith(fontSize: 14)),
      content: Text(LocaleKeys.youMustLoginFirst.tr(), style: context.regularText.copyWith(fontSize: 14)),
      actions: [
        Row(
          children: [
            Expanded(
              child: AppBtn(
                onPressed: () => Navigator.pop(context),
                title: LocaleKeys.cancel.tr(),
                textColor: context.primaryColor,
                backgroundColor: context.primaryColorLight,
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: AppBtn(
                onPressed: () {
                  Navigator.pop(context);
                  pushAndRemoveUntil(NamedRoutes.welcome);
                },
                title: LocaleKeys.ok.tr(),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
