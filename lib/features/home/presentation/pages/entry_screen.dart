import 'package:clean_pattern/common/constant/app_asset.dart';
import 'package:clean_pattern/common/constant/app_color.dart';
import 'package:clean_pattern/config/routes.dart';
import 'package:clean_pattern/features/home/presentation/controller/entry_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class EntryScreen extends StatelessWidget {
  final _controller = Get.find<EntryController>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _controller.onBackDevice,
      child: Scaffold(
        extendBody: true,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () => Get.toNamed(Routes.post),
          backgroundColor: AppColor.primary,
          child: Image.asset(
            AppAsset.imageShare,
            height: 18.sp,
            color: Colors.white,
          ),
        ),
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "We eat".tr,
                style: TextStyle(letterSpacing: 2.sp),
              ),
              SizedBox(width: 5.w),
              GetBuilder<EntryController>(builder: (_) {
                return Image.asset(
                  AppAsset.ramenOutlined,
                  height: 20.sp,
                  color: Get.theme.iconTheme.color,
                );
              }),
              SizedBox(width: 5.w),
              Text(
                "together".tr,
                style: TextStyle(letterSpacing: 2.sp),
              ),
            ],
          ),
        ),
        body: GetBuilder<EntryController>(builder: (_) {
          return PageView.builder(
            itemCount: _controller.listScreen.length,
            controller: _controller.pageController,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => _controller.listScreen[index],
          );
        }),
        bottomNavigationBar: GetBuilder<EntryController>(
          builder: (_) => BottomAppBar(
            height: 50.h,
            shape: CircularNotchedRectangle(),
            notchMargin: 7.sp,
            child: Row(
              children: [
                _bottomBarItem(
                  index: HomeTabIndex.store,
                  image: AppAsset.store,
                  text: "Store".tr,
                ),
                _bottomBarItem(
                  index: HomeTabIndex.article,
                  image: AppAsset.foodArticle,
                  text: "Article".tr,
                ),
                SizedBox(width: 10.w),
                _bottomBarItem(
                  index: HomeTabIndex.flavor,
                  image: AppAsset.flavorSetting,
                  text: "Flavor".tr,
                ),
                _bottomBarItem(
                  index: HomeTabIndex.setting,
                  image: AppAsset.settings,
                  text: "Settings".tr,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _bottomBarItem({
    required int index,
    required String image,
    required String text,
  }) {
    return Expanded(
      child: InkWell(
        onTap: () => _controller.onSelectBottomBar(index),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image,
              height: _controller.selectedIndex == index ? 20.sp : 17.sp,
              color: _controller.selectedIndex == index
                  ? AppColor.primaryBold
                  : AppColor.disable,
            ),
            AnimatedCrossFade(
              duration: Duration(milliseconds: 200),
              firstChild: Text(
                text,
                style: TextStyle(color: AppColor.primaryBold, fontSize: 14.sp),
              ),
              secondChild: SizedBox(),
              crossFadeState: (_controller.selectedIndex == index)
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
            ),
          ],
        ),
      ),
    );
  }
}
