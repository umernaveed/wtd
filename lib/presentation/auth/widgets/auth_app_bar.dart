import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:we_ship_faas/app/core/assets/drawables.dart';

enum AuthScreenType {
  withLargeAppLogo,
  withSmallAppLogo;

  bool get isSmall => this == AuthScreenType.withSmallAppLogo;
}

class AuthCustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AuthCustomAppBar({
    super.key,
    this.appLogoVisble = true,
    this.backButtonVisible = true,
    this.usingNavigator = false,
    this.backID,
  }) : _type = AuthScreenType.withLargeAppLogo;
  final bool appLogoVisble;
  final bool backButtonVisible;
  final AuthScreenType _type;
  final bool usingNavigator;
  final int? backID;

  const AuthCustomAppBar.withSmallAppLogo({
    super.key,
    this.backButtonVisible = true,
    this.appLogoVisble = true,
    this.usingNavigator = false,
    this.backID,
  }) : _type = AuthScreenType.withSmallAppLogo;

  @override
  Size get preferredSize => Size.fromHeight(_type.isSmall ? 8.h : 17.h);

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: ExactAssetImage(
            'assets/images/main_account_gradient.png',
          ),
        ),
      ),
      alignment: Alignment.bottomCenter,
      child: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (backButtonVisible) ...[
              IconButton(
                icon: SvgPicture.asset(Drawables.icBack),
                onPressed: () {
                  if (usingNavigator) {
                    Navigator.of(context).pop();
                  } else {
                    Get.back(id: backID);
                  }
                },
              ),
            ] else ...[
              SizedBox(
                width: 10.2.w,
                height: 8.h,
              ),
            ],
            const Spacer(),
            SizedBox(width: 8.1.w),
            Visibility(
              visible: appLogoVisble,
              child: Image.asset(
                'assets/images/brand_logo.png',
                fit: BoxFit.contain,
                width: _type.isSmall ? 25.w : 49.w,
                height: _type.isSmall ? 8.h : 14.h,
              ),
            ),
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
