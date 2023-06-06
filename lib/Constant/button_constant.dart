import 'package:demo_app/Constant/theme_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButtonTheme {
  static AnimatedContainer project1Button({
    required double height,
    required double width,
    required Widget child,
    EdgeInsetsGeometry? padding,
    int duration = 0,
    required bool isProcessing ,
    double radius = 12,
  }) {
    return AnimatedContainer(
      duration: Duration(milliseconds: duration),
      height: height.h ,
      width: isProcessing ? height.h :  width.w ,
      padding: padding,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Project1Theme.themeColor,
          borderRadius: BorderRadius.circular(isProcessing ? height.h / 2 :radius.r),
          boxShadow: [
            BoxShadow(
              color: Project1Theme.themeColor.withOpacity(0.2),
              offset: const Offset(0, 3),
              spreadRadius: 2,
              blurRadius: 20,
            )
          ]),
      child: isProcessing ? const CircularProgressIndicator(color: Project1Theme.white,):child ,
    );
  }
}
