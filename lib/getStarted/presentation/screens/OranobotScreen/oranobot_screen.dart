import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:tatware/core/utils/decoration_helper.dart';
import 'package:tatware/core/utils/fonts_helper.dart';
import 'package:tatware/core/utils/route.dart';
import 'package:tatware/core/utils/theme/theme.dart';
import 'package:tatware/getStarted/presentation/screens/OranobotChatScreen/oranobot_chat_screen.dart';

class OranobotScreen extends StatelessWidget {
  const OranobotScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          ///
          ///
          ///
          const Spacer(),
          Stack(
            clipBehavior: Clip.none,
            alignment: AlignmentDirectional.center,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.only(start: 120.w, top: 96.h),
                child: Image.asset(
                  'assets/images/oranobot_cover.png',
                  width: 230.w,
                  height: 250.h,
                ),
              ),
              PositionedDirectional(
                start: 44.w,
                top: 40.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hi, My name is ',
                      style: cairoW400(color: Colors.black, size: 19),
                    ),
                    Text(
                      'Oranobot',
                      style: cairoW600(color: Colors.black, size: 19),
                    ),
                  ],
                ),
              ),
              PositionedDirectional(
                top: 80.h,
                child: Text(
                  'I will always be there to help\nand assist you.\n\nSay Start To go to Next.',
                  style: cairoW400(color: Colors.black, size: 19),
                ),
              ),
            ],
          ),

          ///
          /// oranobot image
          ///
          Image.asset(
            'assets/images/oranobot_image.png',
            width: 240.w,
            height: 300.h,
          ),
          SizedBox(height: 24.h),

          ///
          /// Next
          ///
          GestureDetector(
            onTap: () => fadNavigate(context, const OranobotChatScreen()),
            child: Container(
              width: 147.w,
              height: 53.h,
              margin: EdgeInsets.symmetric(horizontal: 26.w),
              decoration: decorationRadius(color: buttonColor),
              child: Center(
                child: Text(
                  'Next',
                  style: cairoW400(color: Colors.white),
                ),
              ),
            ),
          ),
          SizedBox(height: 55.h),

          ///
          /// Language
          ///
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.language, size: 16, color: Colors.black),
              SizedBox(width: 8.w),
              Padding(
                padding: EdgeInsets.only(top: 8.h),
                child: Text(
                  'English',
                  style: cairoW300(color: Colors.black, size: 12),
                ),
              ),
            ],
          ),
          SizedBox(height: 28.h),
        ],
      ),
    );
  }
}
