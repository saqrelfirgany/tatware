import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:tatware/core/utils/decoration_helper.dart';
import 'package:tatware/core/utils/fonts_helper.dart';
import 'package:tatware/core/utils/theme/theme.dart';

class CurrentUserChatItem extends StatelessWidget {
  const CurrentUserChatItem({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 36.w, end: 14.w, top: 30.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: 280.w,
            padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 14.w),
            decoration: decorationRadius(color: buttonColor),
            child: Text(
              text,
              style: cairoW400(color: Colors.white, size: 14),
              overflow: TextOverflow.visible,
            ),
          ),
          SizedBox(width: 16.w),
          Container(
            width: 20.w,
            height: 10.w,
            child: Image.asset(
              'assets/icons/double_done.png',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
}
