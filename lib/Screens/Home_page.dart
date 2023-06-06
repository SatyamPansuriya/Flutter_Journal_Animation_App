import 'package:animations/animations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:demo_app/Animation_Constant/transform_Animation.dart';
import 'package:demo_app/Constant/textField_widget.dart';
import 'package:demo_app/Constant/text_widget.dart';
import 'package:demo_app/Constant/theme_constants.dart';
import 'package:demo_app/Constant/widget_const.dart';
import 'package:demo_app/Controller/Home_page_controller.dart';
import 'package:demo_app/Data_Constant/List%20data.dart';
import 'package:demo_app/Screens/Detail_Page.dart';
import 'package:demo_app/assets_path_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  HomePageController controller = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Column(
          children: [
            /// Profile Bar
            FadeSlideTransition(
              duration: 300,
              x: 0,
              y: 100,
              child: SafeArea(
                  child: symmetricPadding(
                horizontal: 20.w,
                vertical: 10.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 220.w,
                          child: TextWidget.textWidgetConst(
                              title: 'Satyam Pareshbhai Pansuriya',
                              fontSize: 25,
                              textOverflow: TextOverflow.ellipsis,
                              color: Project1Theme.themeColor,
                              fontWeight: FontWeight.bold),
                        ),
                        TextWidget.textWidgetConst(title: 'Today 25 May, 2023', fontSize: 20, color: Project1Theme.themeColor, fontWeight: FontWeight.bold),
                      ],
                    ),
                    Container(
                      height: 60.h,
                      width: 60.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.r),
                        color: Colors.green,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: CachedNetworkImage(
                          imageUrl: "https://source.unsplash.com/random/900%C3%97700/?person",
                          // imageUrl: "https://source.unsplash.com/random/900×700/?fruit",
                          fit: BoxFit.cover,
                          progressIndicatorBuilder: (context, url, downloadProgress) => CircularProgressIndicator(value: downloadProgress.progress),
                          errorWidget: (context, url, error) => const Icon(Icons.error),
                        ),
                      ),
                    )
                  ],
                ),
              )),
            ),

            /// SearchBar
            FadeSlideTransition(
              startAfter: 150,
              duration: 300,
              x: 0,
              y: 100,
              child: symmetricPadding(
                horizontal: 20.w,
                child: CustomTextField(
                  controller: controller.searchController,
                  hintText: "Search",
                  fillColor: Project1Theme.white,
                  suffixIcon: symmetricPadding(
                    horizontal: 15,
                    vertical: 10,
                    child: SvgPicture.asset(
                      "Assets/Icons/microphone.svg",
                      height: 20.h,
                      width: 20.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                  prefixIcon: symmetricPadding(
                    horizontal: 15,
                    vertical: 10,
                    child: SvgPicture.asset(
                      "Assets/Icons/search.svg",
                      height: 20.h,
                      width: 20.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            heightBox(11.h),

            /// Filter List
            FadeSlideTransition(
              startAfter: 300,
              duration: 300,
              x: 0,
              y: 100,
              child: SizedBox(
                height: 45.h,
                child: ListView.builder(
                  itemCount: names.length,
                  shrinkWrap: true,
                  physics: const AlwaysScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 20,
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(left: index == 0 ? 22.w : 0.w, right: 10.w),
                      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.h),
                      decoration: BoxDecoration(
                        color: ColorGenerator().generateRandomSoftColor().withOpacity(0.28),
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                      child: TextWidget.textWidgetConst(title: names[index], fontSize: 14.sp, textAlign: TextAlign.center, fontWeight: FontWeight.w700),
                    );
                  },
                ),
              ),
            ),

            /// Card
            Expanded(
              child: onlyPadding(
                top: 10,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(25.r), topRight: Radius.circular(25.r)),
                  child: AnimationLimiter(
                    child: ListView.builder(
                      padding: EdgeInsets.only(top: 15.h),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: 6,
                      addAutomaticKeepAlives: true,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        /// generate Color For Like Icon
                        Color color = ColorGenerator().generateRandomSoftColor();

                        /// is Like true or false
                        RxBool isLike = false.obs;

                        return AnimationConfiguration.staggeredList(
                          position: index,
                          delay: const Duration(milliseconds: 200),
                          duration: const Duration(milliseconds: 300),
                          child: SlideAnimation(
                            verticalOffset: 150.0,
                            child:
                                 GestureDetector(
                                   onTap:() {
                                     Get.to(DetailsPage());
                                   },
                                   child: Container(
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.r), color: Project1Theme.white, boxShadow: [
                                      BoxShadow(color: Project1Theme.shadowColor, offset: Offset(4.w, 4.h), spreadRadius: 4.r, blurRadius: 20.r),
                                    ]),
                                    margin: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 17.h),
                                    child: Hero(
                                      tag: "New$index",
                                      child: Container(
                                        child: Column(
                                              children: [
                                                widthBox(Get.width),

                                                /// Title
                                                Padding(
                                                  padding: EdgeInsets.all(8.h.w),
                                                  child: leftAlign(
                                                    child: TextWidget.textWidgetConst(
                                                      title: "Today is new day",
                                                      color: Project1Theme.themeColor,
                                                      fontSize: 17.sp,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                ),

                                                /// Description
                                                onlyPadding(
                                                  left: 8.w,
                                                  right: 8.w,
                                                  bottom: 8.h,
                                                  child: TextWidget.textWidgetConst(
                                                      title: "Here are description about your journal and here are basic Information about day to day life and many more.",
                                                      color: Project1Theme.themeColor.withOpacity(0.6)),
                                                ),

                                                onlyPadding(
                                                  left: 2.w,
                                                  child: Row(
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: [
                                                      SvgPicture.asset(
                                                        calender,
                                                        height: 30.h,
                                                        width: 30.h,
                                                        fit: BoxFit.scaleDown,
                                                      ),
                                                      onlyPadding(
                                                          top: 2.h,
                                                          child: TextWidget.textWidgetConst(
                                                              title: "23 May, 2023", fontWeight: FontWeight.bold, color: Project1Theme.themeColor, fontSize: 13.sp)),
                                                      const Spacer(),
                                                      Obx(() {
                                                        return GestureDetector(
                                                          onTap: () {
                                                            isLike.value = !isLike.value;
                                                          },
                                                          child: Container(
                                                            height: 40.h,
                                                            width: 40.h,
                                                            margin: EdgeInsets.only(right: 0.0.w),
                                                            decoration: BoxDecoration(
                                                                color: isLike.value ? color.withOpacity(0.25) : null,
                                                                border: Border.all(width: 2.0, color: color.withOpacity(0.5)),
                                                                borderRadius: BorderRadius.only(
                                                                    topRight: Radius.circular(30.w),
                                                                    bottomRight: Radius.circular(20.w),
                                                                    bottomLeft: Radius.circular(30.w),
                                                                    topLeft: Radius.circular(30.w))),
                                                            padding: EdgeInsets.all(10.r),
                                                            child: SvgPicture.asset(heartFilled, color: isLike.value ? null : color.withOpacity(0.25)),
                                                          ),
                                                        );
                                                      })
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                      ),
                                    ),

                            ),
                                 ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
