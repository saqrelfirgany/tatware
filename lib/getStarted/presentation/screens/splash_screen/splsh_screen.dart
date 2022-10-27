import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:tatware/core/utils/decoration_helper.dart';
import 'package:tatware/core/utils/fonts_helper.dart';
import 'package:tatware/core/utils/route.dart';
import 'package:tatware/core/utils/theme/theme.dart';
import 'package:tatware/getStarted/presentation/screens/OranobotScreen/oranobot_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/splash_cover.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            ///
            /// Oranos Title
            ///
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Oranos',
                  style: cairoW700(color: Colors.black, size: 42),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 28.h),
                  child: Container(
                    width: 12.w,
                    height: 12.w,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: buttonColor,
                    ),
                  ),
                )
              ],
            ),

            ///
            /// Expert From Every Planet
            ///
            Text(
              'Expert From Every Planet',
              style: cairoW400(color: Color(0xFF5F5F5F), size: 24),
            ),
            const Spacer(),

            ///
            /// Get Started
            ///
            GestureDetector(
              onTap: () => fadNavigate(context, const OranobotScreen()),
              child: Container(
                width: double.infinity,
                height: 53.h,
                margin: EdgeInsets.symmetric(horizontal: 26.w),
                decoration: decorationRadius(color: buttonColor),
                child: Center(
                  child: Text(
                    'Get Started',
                    style: cairoW400(color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(height: 36.h),

            ///
            /// SignUp
            ///
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don’t have an account?',
                  style: cairoW300(color: Colors.black, size: 12),
                ),
                Text(
                  ' SignUp',
                  style: cairoW300(color: buttonColor, size: 12),
                ),
              ],
            ),
            SizedBox(height: 8.h),

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
      ),
    );
  }
}
