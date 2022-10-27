import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tatware/core/SharedComponents/net_image.dart';
import 'package:tatware/core/services/service_locator.dart';
import 'package:tatware/core/utils/app_constants.dart';
import 'package:tatware/core/utils/decoration_helper.dart';
import 'package:tatware/core/utils/enums.dart';
import 'package:tatware/core/utils/fonts_helper.dart';
import 'package:tatware/core/utils/theme/theme.dart';
import 'package:tatware/experts/domain/entities/expert.dart';
import 'package:tatware/experts/presentation/controllers/expert_bloc.dart';
import 'package:tatware/experts/presentation/controllers/expert_event.dart';
import 'package:tatware/experts/presentation/controllers/expert_state.dart';

import 'body/home_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => getIt<ExpertBloc>()..add(GetRecommendedExpertEvent()),
        child: BlocBuilder<ExpertBloc, ExpertState>(
          builder: (context, state) {
            print(state);
            switch (state.recommendedExpertState) {
              case RequestStates.loading:
                return const Center(
                  child: SpinKitFadingCircle(
                    color: buttonColor,
                    size: 30.0,
                  ),
                );
              case RequestStates.loaded:
                return HomeScreenData(recommendedExpert: state.recommendedExpert);

              case RequestStates.error:
                Container(
                  child: Text('error'),
                );
                return Container();
            }
          },
        ),
      ),
    );
  }
}

class HomeScreenData extends StatefulWidget {
  const HomeScreenData({Key? key, required this.recommendedExpert}) : super(key: key);
  final List<Expert> recommendedExpert;

  @override
  State<HomeScreenData> createState() => _HomeScreenDataState();
}

class _HomeScreenDataState extends State<HomeScreenData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14.w),
        child: Column(
          children: [
            SizedBox(height: 16.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Recommended Experts',
                  style: cairoW400(color: titleColor),
                ),
                Image.asset('assets/icons/more.png'),
              ],
            ),
            SizedBox(height: 16.h),

            ///
            /// Recommended Experts
            ///
            SizedBox(
              height: 260.h,
              child: ListView(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: List.generate(
                  widget.recommendedExpert.length,
                  (index) => Container(
                    width: 185.w,
                    height: 185.h,
                    margin: EdgeInsetsDirectional.only(
                      start: index == 0 ? 0 : 12.w,
                      bottom: 4.h,
                    ),
                    decoration: decorationRadius(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(8.r),
                            topLeft: Radius.circular(8.r),
                          ),
                          child: SizedBox(
                            height: 150.h,
                            width: 185.w,
                            child: NetImage(
                              uri:
                                  AppConstants.imageEndPoint + widget.recommendedExpert[index].backdropPath,
                            ),
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 14.w),
                          child: Row(
                            children: [
                              Image.asset('assets/icons/star.png'),
                              SizedBox(width: 8.w),
                              Text(
                                '(${widget.recommendedExpert[index].voteAverage})',
                                style: cairoW400(color: titleColor, size: 14),
                              ),
                              Spacer(),
                              GestureDetector(
                                onTap: () => setState(
                                  () => widget.recommendedExpert[index].favorite =
                                      !widget.recommendedExpert[index].favorite,
                                ),
                                child: Image.asset(
                                  'assets/icons/like.png',
                                  color: widget.recommendedExpert[index].favorite
                                      ? Colors.red.shade900
                                      : chatColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 14.w),
                          child: Text(
                            widget.recommendedExpert[index].originalTitle,
                            style: cairoW400(color: titleColor, size: 14),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 14.w),
                          child: Text(
                            widget.recommendedExpert[index].overview,
                            style: cairoW400(color: titleColor, size: 14),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            ///
            /// Online Experts
            ///
            SizedBox(height: 16.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Online Experts',
                  style: cairoW400(color: titleColor),
                ),
                Image.asset('assets/icons/more.png'),
              ],
            ),
            SizedBox(height: 16.h),
            SizedBox(
              height: 100.h,
              child: ListView(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: List.generate(
                  widget.recommendedExpert.length,
                  (index) => Container(
                    width: 65.w,
                    height: 90.h,
                    margin: EdgeInsetsDirectional.only(
                      start: index == 0 ? 0 : 12.w,
                      bottom: 4.h,
                    ),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(65.r),
                          child: Container(
                            width: 65.w,
                            height: 65.h,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: NetImage(
                              uri:
                                  AppConstants.imageEndPoint + widget.recommendedExpert[index].backdropPath,
                            ),
                          ),
                        ),
                        PositionedDirectional(
                          end: 4.w,
                          child: Container(
                            width: 8.w,
                            height: 8,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.green.shade700,
                            ),
                          ),
                        ),
                        PositionedDirectional(
                          bottom: 8.h,
                          child: Text(
                            widget.recommendedExpert[index].originalTitle,
                            style: cairoW400(color: titleColor, size: 9),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 80,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              offset: const Offset(0, 0),
              blurRadius: 4.0,
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                print('ssss');
                showModalBottomSheet(
                  context: context,
                  builder: (context) => StatefulBuilder(
                    builder: (context, setState) {
                      return Container(
                        height: 730.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadiusDirectional.only(
                            topStart: Radius.circular(16.r),
                            topEnd: Radius.circular(16.r),
                          ),
                        ),
                        child: ListView(
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          physics: const BouncingScrollPhysics(),
                          children: List.generate(
                            8,
                            (index) => Container(
                              width: double.infinity,
                              height: 80,
                              margin: EdgeInsetsDirectional.all(8.w),
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              decoration: decorationRadius(),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset('assets/icons/bottom_sheer_icon.png'),
                                  SizedBox(width: 16.w),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Information Technology',
                                        style: cairoW400(color: Colors.black, size: 14),
                                      ),
                                      Text(
                                        '23 Experts',
                                        style: cairoW400(color: Colors.black, size: 12),
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  Image.asset('assets/icons/arrow.png'),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
              child: Padding(
                padding: EdgeInsetsDirectional.only(start: 16, end: 16, bottom: 16),
                child: Image.asset('assets/icons/bottom_sheet.png'),
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset('assets/icons/home.png'),
                  const SizedBox(),
                  Image.asset('assets/icons/favorites.png'),
                  const SizedBox(),
                  Image.asset('assets/icons/wallet.png'),
                  const SizedBox(),
                  Image.asset('assets/icons/profile.png'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
