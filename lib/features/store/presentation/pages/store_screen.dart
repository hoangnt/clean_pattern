import 'package:clean_pattern/common/core_ui/app_style.dart';
import 'package:clean_pattern/common/widget/app_empty_data_widget.dart';
import 'package:clean_pattern/features/store/presentation/controller/store_controller.dart';
import 'package:clean_pattern/features/store/presentation/pages/widget/item_store_widget.dart';
import 'package:clean_pattern/features/store/presentation/pages/widget/item_top_store_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class StoreScreen extends StatelessWidget {
  final _controller = Get.find<StoreController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        color: AppColor.primary,
        onRefresh: _controller.fetchData,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Obx(
            () {
              if (_controller.isLoading.value &&
                  _controller.listStore.isEmpty &&
                  _controller.listTopStore.isEmpty) {
                return const SizedBox();
              }

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 8.h),
                  Padding(
                    padding: EdgeInsets.only(left: 10.w),
                    child: Text(
                      "Top 10 on 10".tr,
                      style: AppTextStyle.w500(18.sp),
                    ),
                  ),
                  SizedBox(height: 5.h),
                  SizedBox(
                    width: double.infinity,
                    height: 0.17.sh,
                    child: ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      scrollDirection: Axis.horizontal,
                      itemCount: _controller.listTopStore.length,
                      itemBuilder: (context, index) {
                        return ItemTopStoreWidget(
                          item: _controller.listTopStore[index],
                          index: index,
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 7.h),
                  Padding(
                    padding: EdgeInsets.only(left: 10.w),
                    child: Text(
                      "Would you like to go?".tr,
                      style: AppTextStyle.w500(18.sp),
                    ),
                  ),
                  SizedBox(height: 5.h),
                  (_controller.listStore.isNotEmpty)
                      ? ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          itemCount: _controller.listStore.length,
                          itemBuilder: (context, index) {
                            return ItemStoreWidget(
                              item: _controller.listStore[index],
                            );
                          },
                        )
                      : AppEmptyDataWidget(height: 500.h),
                  const SizedBox(height: kBottomNavigationBarHeight),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
