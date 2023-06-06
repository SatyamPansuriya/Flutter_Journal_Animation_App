import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController{
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

  TextEditingController searchController = TextEditingController();
  int increaseStartAfter = 300;

}


class ColorGenerator {
  Color currentColor = Colors.white;

  Color generateRandomSoftColor() {
    Random random = Random();
    Color newColor;
    do {
      newColor = Color.fromRGBO(
        random.nextInt(128) + 127,
        random.nextInt(128) + 127,
        random.nextInt(128) + 127,
        1,
      );
    } while (_isSimilar(currentColor, newColor));
    currentColor = newColor;
    return newColor;
  }

  bool _isSimilar(Color color1, Color color2) {
    final int dr = color1.red - color2.red;
    final int dg = color1.green - color2.green;
    final int db = color1.blue - color2.blue;
    final int distanceSquared = dr * dr + dg * dg + db * db;
    // You can adjust the threshold value as needed
    const int threshold = 128 * 128;
    return distanceSquared < threshold;
  }
}