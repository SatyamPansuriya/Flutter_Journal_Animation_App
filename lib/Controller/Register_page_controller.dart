
import 'package:demo_app/Screens/Home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPageController extends GetxController with GetTickerProviderStateMixin{
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady

    

    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }


  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  RxBool isAnimation = true.obs;
  RxBool isProcessing = false.obs;

  RxBool isPasswordSecure = true.obs;
  RxBool isConfirmPasswordSecure = true.obs;

  onTapSkip(){
    Get.offAll( () => HomePage(),duration: const Duration(milliseconds: 1500),transition: Transition.fadeIn);
  }
}