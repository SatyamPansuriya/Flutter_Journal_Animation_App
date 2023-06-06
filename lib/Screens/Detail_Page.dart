import 'package:demo_app/Controller/Details_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsPage extends StatelessWidget {
   DetailsPage({Key? key}) : super(key: key);

   DetailsPageController controller = Get.put(DetailsPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Hero(
        tag: "New",
        child: Container(
          child: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Center(
              child: Container(color: Colors.red,),
            ),
          ),
        ),
      ),
    );
  }
}
