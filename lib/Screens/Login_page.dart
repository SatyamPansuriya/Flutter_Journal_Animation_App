import 'package:demo_app/Animation_Constant/transform_Animation.dart';
import 'package:demo_app/Constant/button_constant.dart';
import 'package:demo_app/Constant/textField_widget.dart';
import 'package:demo_app/Constant/text_widget.dart';
import 'package:demo_app/Constant/widget_const.dart';
import 'package:demo_app/Controller/Login_page_controller.dart';
import 'package:demo_app/Screens/Register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../Constant/theme_constants.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  LoginPageController controller = Get.put(LoginPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: SafeArea(
          child: SingleChildScrollView(
            child: symmetricPadding(
              horizontal: 25,
              child: Column(
                children: [
                  widthBox(Get.width),

                  /// SKIP Text
                  GestureDetector(
                    onTap: controller.onTapSkip,
                    child: rightAlign(
                      child: onlyPadding(
                        top: 15,
                        child: TextWidget.textWidgetConst(
                            title: "Skip",
                            fontSize: 20,
                            color: Project1Theme.themeColor,
                            fontFamily: "Smoolthan"),
                      ),
                    ),
                  ),

                  /// Title Text
                  FadeSlideTransition(
                    duration: 300,
                    isStart: controller.isAnimation.value,
                    x: 0,
                    y: 100,
                    child: onlyPadding(
                      top: 50,
                      child: TextWidget.textWidgetConst(
                          title: "Journaling \nMade fun and \nsimple. ",
                          fontSize: 40,
                          color: Project1Theme.themeColor,
                          fontFamily: "Smoolthan",
                          textAlign: TextAlign.center,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1.2),
                    ),
                  ),

                  /// Email TextField
                  FadeSlideTransition(
                    startAfter: 150,
                    duration: 300,
                    isStart: controller.isAnimation.value,
                    x: 0,
                    y: 100,
                    child: onlyPadding(
                        top: 80,
                        child: CustomTextField(
                            hintText: "Email",
                            fillColor: Colors.white,
                            controller: controller.emailController)),
                  ),

                  /// Password TextField
                  FadeSlideTransition(
                    startAfter: 300,
                    duration: 300,
                    isStart: controller.isAnimation.value,
                    x: 0,
                    y: 100,
                    child: onlyPadding(
                      top: 25,
                      child: CustomTextField(
                        hintText: "Password",
                        fillColor: Colors.white,
                        controller: controller.passwordController,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            controller.isPasswordSecure.value = !controller.isPasswordSecure.value;
                          },
                          child: Obx(() {
                            return Container(
                              height: 30.w,
                              width: 30.w,
                              padding: EdgeInsets.all(2.w),
                              margin: EdgeInsets.only(right:10.w),
                              child: SvgPicture.asset(
                                controller.isPasswordSecure.value ?  "Assets/Icons/eye-slash.svg" : "Assets/Icons/eye.svg",
                                color: Project1Theme.themeColor.withOpacity(1),


                              ),
                            );
                          }),
                        ),
                      ),
                    ),
                  ),

                  FadeSlideTransition(
                    startAfter: 450,
                    duration: 300,
                    isStart: controller.isAnimation.value,
                    x: 0,
                    y: 100,
                    child: onlyPadding(
                        top: 15,
                        child: rightAlign(
                            child: TextWidget.textWidgetConst(
                                title: "Forgot Password?",
                                color: Project1Theme.themeColor,
                                fontSize: 18))),
                  ),

                  /// Login Button
                  GestureDetector(
                    onTap: !controller.isProcessing.value
                        ? controller.onTapLogin
                        : null,
                    child: FadeSlideTransition(
                      startAfter: 600,
                      duration: 300,
                      isStart: controller.isAnimation.value,
                      x: 0,
                      y: 100,
                      child: onlyPadding(
                        top: 50,
                        child: FittedBox(
                          child: Obx(() {
                            return CustomButtonTheme.project1Button(
                              duration: 200,
                              isProcessing: controller.isProcessing.value,
                              height: 50,
                              width: 150,
                              child: TextWidget.textWidgetConst(
                                  key: const ValueKey<int>(1),
                                  title: "Login",
                                  color: Project1Theme.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700),
                            );
                          }),
                        ),
                      ),
                    ),
                  ),

                  /// Register or Login Text
                  FadeSlideTransition(
                    startAfter: 750,
                    duration: 300,
                    isStart: controller.isAnimation.value,
                    x: 0,
                    y: 100,
                    child: onlyPadding(
                      top: 30,
                      child: GestureDetector(
                        onTap: () {
                          Get.offAll(() => RegisterPage(),
                              duration: const Duration(milliseconds: 1500),
                              transition: Transition.fadeIn);
                        },
                        child: TextWidget.textWidgetConst(
                            title: "Register", fontSize: 18),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
