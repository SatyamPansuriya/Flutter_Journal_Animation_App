import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

SizedBox heightBox(double height) {
  return SizedBox(
    height: height.h,
  );
}

SizedBox widthBox(double width) {
  return SizedBox(
    width: width.w,
  );
}

Padding onlyPadding(
    {double top = 0.0,
    double left = 0.0,
    double right = 0.0,
    double bottom = 0.0,
    required Widget child}) {
  return Padding(
    padding: EdgeInsets.only(
        top: top.h, bottom: bottom.h, right: right.w, left: left.w),
    child: child,
  );
}

Padding symmetricPadding(
    {double vertical = 0.0, double horizontal = 0.0, required Widget child}) {
  return Padding(
    padding:
        EdgeInsets.symmetric(vertical: vertical.h, horizontal: horizontal.w),
    child: child,
  );
}


Align centerAlign({required Widget child}){
  return Align(alignment: Alignment.center,child: child,);
}

Align leftAlign({required Widget child}){
  return Align(alignment: Alignment.centerLeft,child: child,);
}

Align rightAlign({required Widget child}){
  return Align(alignment: Alignment.centerRight,child: child,);
}
