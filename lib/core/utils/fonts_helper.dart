import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';

TextStyle cairoW300({double size = 16, required Color color}) {
  return TextStyle(
    fontFamily: 'CairoRegular',
    fontWeight: FontWeight.w300,
    overflow: TextOverflow.ellipsis,
    fontSize: size,
    color: color,
  );
}

TextStyle cairoW400({double size = 16, required Color color}) {
  return TextStyle(
    fontFamily: 'CairoRegular',
    fontWeight: FontWeight.w400,
    overflow: TextOverflow.ellipsis,
    fontSize: size,
    color: color,
  );
}

TextStyle cairoW500({double size = 16, required Color color}) {
  return TextStyle(
    fontFamily: 'CairoRegular',
    fontWeight: FontWeight.w500,
    overflow: TextOverflow.ellipsis,
    fontSize: size,
    color: color,
  );
}

TextStyle cairoW600({double size = 16, required Color color}) {
  return TextStyle(
    fontFamily: 'CairoRegular',
    fontWeight: FontWeight.w600,
    overflow: TextOverflow.ellipsis,
    fontSize: size,
    color: color,
  );
}

TextStyle cairoW700({double size = 16, required Color color}) {
  return TextStyle(
    fontFamily: 'CairoRegular',
    fontWeight: FontWeight.w700,
    fontSize: size,
    overflow: TextOverflow.ellipsis,
    color: color,
  );
}
