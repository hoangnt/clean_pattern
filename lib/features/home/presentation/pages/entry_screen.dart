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
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
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
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(Routes.post),
        backgroundColor: AppColor.primary,
        child: Image.asset(
          AppAsset.imageShare,
          height: 18.sp,
          color: Colors.white,
        ),
      ),
      bottomNavigationBar: GetBuilder<EntryController>(
        builder: (_) => BottomNavigationBar(
          currentIndex: _controller.selectedIndex,
          onTap: _controller.onSelectBottomBar,
          showUnselectedLabels: false,
          showSelectedLabels: true,
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: TextStyle(fontSize: 11.sp),
          selectedItemColor: AppColor.primary,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              label: "Store".tr,
              icon: Image.asset(
                AppAsset.store,
                height: _controller.selectedIndex == 0 ? 15.sp : 13.sp,
                color: _controller.selectedIndex == 0
                    ? AppColor.primaryBold
                    : AppColor.disable,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Article'.tr,
              icon: Image.asset(
                AppAsset.foodArticle,
                height: _controller.selectedIndex == 0 ? 15.sp : 13.sp,
                color: _controller.selectedIndex == 1
                    ? AppColor.primaryBold
                    : AppColor.disable,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Flavor'.tr,
              icon: Image.asset(
                AppAsset.flavorSetting,
                height: _controller.selectedIndex == 0 ? 15.sp : 13.sp,
                color: _controller.selectedIndex == 2
                    ? AppColor.primaryBold
                    : AppColor.disable,
              ),
            ),
            BottomNavigationBarItem(
              label: "Settings".tr,
              icon: Image.asset(
                AppAsset.settings,
                height: _controller.selectedIndex == 3 ? 15.sp : 13.sp,
                color: _controller.selectedIndex == 3
                    ? AppColor.primaryBold
                    : AppColor.disable,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
