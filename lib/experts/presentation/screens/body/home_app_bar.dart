import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:tatware/core/utils/fonts_helper.dart';
import 'package:tatware/core/utils/theme/theme.dart';

AppBar HomeAppBar() {
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: Colors.white,
    elevation: 1,
    centerTitle: true,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Oranos',
          style: cairoW700(color: Colors.black, size: 24),
        ),
        Padding(
          padding: EdgeInsets.only(top: 28.h),
          child: Container(
            width: 8.w,
            height: 8.w,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: buttonColor,
            ),
          ),
        )
      ],
    ),
    actions: [
      Padding(
        padding: EdgeInsetsDirectional.only(end: 16.w),
        child: Center(
          child: Image.asset(
            'assets/icons/search.png',
            width: 23.w,
            height: 23.w,
            fit: BoxFit.fill,
          ),
        ),
      ),
    ],
    leading: Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24.r),
        child: Image.asset(
          'assets/images/oranobot_image.png',
          width: 23.w,
          height: 23.w,
          fit: BoxFit.fill,
        ),
      ),
    ),
  );
}