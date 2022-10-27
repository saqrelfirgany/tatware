import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:tatware/core/utils/decoration_helper.dart';
import 'package:tatware/core/utils/fonts_helper.dart';
import 'package:tatware/core/utils/theme/theme.dart';

class OranobotChatItem extends StatelessWidget {
  const OranobotChatItem({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 18.w, end: 36.w, top: 30.h),
      child: Row(
        children: [
          Container(
            width: 38.w,
            height: 38.w,
            padding: const EdgeInsets.all(6),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: chatColor,
            ),
            child: Image.asset('assets/icons/chat.png'),
          ),
          SizedBox(width: 16.w),
          Container(
            width: 280.w,
            padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 14.w),
            decoration: decorationRadius(color: chatColor),
            child: Text(
              text,
              style: cairoW400(color: Colors.black, size: 14),
              overflow: TextOverflow.visible,
            ),
          )
        ],
      ),
    );
  }
}
