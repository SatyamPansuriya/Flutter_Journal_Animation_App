import 'package:get/get.dart';

class DetailsPageController extends GetxController{


  @override
  void onInit() {
    print("Class Init");
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    print("Widget Ready");
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void dispose() {
    print("This is Dispose");
    // TODO: implement dispose
    super.dispose();
  }


  RxString name = "Satyam".obs;
}