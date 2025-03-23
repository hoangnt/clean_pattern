import 'package:clean_pattern/common/constant/gender.dart';
import 'package:clean_pattern/common/core_ui/app_style.dart';
import 'package:clean_pattern/config/routes.dart';
import 'package:clean_pattern/features/customer/presentation/controller/customer_controller.dart';
import 'package:clean_pattern/features/home/presentation/controller/entry_controller.dart';
import 'package:clean_pattern/generated/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class EntryScreen extends StatelessWidget {
  final _controller = Get.find<EntryController>();
  final _customerController = Get.find<CustomerController>();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: _controller.onBackDevice,
      child: Scaffold(
        extendBody: true,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          shape: const CircleBorder(),
          onPressed: () => Get.toNamed(Routes.post),
          backgroundColor: AppColor.primary,
          child: Assets.icon.imageShare.image(
            height: 20.sp,
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
                return Assets.icon.ramenOutlined.image(
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
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => _controller.listScreen[index],
          );
        }),
        bottomNavigationBar: GetBuilder<EntryController>(
          builder: (_) => BottomAppBar(
            elevation: 0,
            height: 68.h,
            shape: const CircularNotchedRectangle(),
            padding: EdgeInsets.zero,
            notchMargin: 10.sp,
            child: Row(
              children: [
                _bottomBarItem(
                  index: HomeTabIndex.store,
                  image: Assets.icon.store.path,
                  text: "Store".tr,
                ),
                _bottomBarItem(
                  index: HomeTabIndex.article,
                  image: Assets.icon.foodArticle.path,
                  text: "Article".tr,
                ),
                SizedBox(width: 10.w),
                _bottomBarItem(
                  index: HomeTabIndex.flavor,
                  image: switch (_customerController.userInfo?.gender) {
                    Gender.male => Assets.icon.man.path,
                    Gender.female => Assets.icon.woman.path,
                    _ => Assets.icon.user.path,
                  },
                  text: "Me".tr,
                ),
                _bottomBarItem(
                  index: HomeTabIndex.setting,
                  image: Assets.icon.settings.path,
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
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => _controller.onSelectBottomBar(index),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image,
              height: _controller.selectedIndex == index ? 23.sp : 20.sp,
              color: _controller.selectedIndex == index
                  ? AppColor.primaryBold
                  : AppColor.disable,
            ),
            AnimatedCrossFade(
              duration: const Duration(milliseconds: 200),
              firstChild: Text(
                text,
                style: AppTextStyle.normal(14.sp).primaryColor,
              ),
              secondChild: const SizedBox(),
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
