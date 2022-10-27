import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tatware/core/utils/theme/theme.dart';

class NetImage extends StatelessWidget {
  final String uri;

  const NetImage({Key? key, required this.uri}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      uri,
      width: double.infinity,
      height: double.infinity,
      fit: BoxFit.fill,
      loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) return child;
        return Center(
          child: SpinKitFadingCircle(
            size: 30.w,
            color: buttonColor,
          ),
        );
      },
      errorBuilder: (
        BuildContext context,
        Object exception,
        StackTrace? stackTrace,
      ) {
        return Image.asset(
          'assets/images/oranobot_image.png',
          fit: BoxFit.fill,
        );
      },
    );
  }
}
