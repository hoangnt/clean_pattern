import 'package:clean_pattern/common/constant/app_color.dart';
import 'package:clean_pattern/features/home/presentation/controller/store_controller.dart';
import 'package:clean_pattern/features/home/presentation/pages/widget/item_store_widget.dart';
import 'package:clean_pattern/features/home/presentation/pages/widget/item_top_store_widget.dart';
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
        onRefresh: _controller.refreshData,
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: GetBuilder<StoreController>(
            builder: (_) {
              if (_controller.isLoading) {
                return SizedBox();
              }

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10.w),
                    child: Text(
                      "Top 10 on 10".tr,
                      style: TextStyle(
                          fontSize: 12.sp, fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 0.2.sh,
                    child: ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      scrollDirection: Axis.horizontal,
                      itemCount: _controller.listTopStore.length,
                      itemBuilder: (context, index) {
                        return ItemTopStoreWidget(
                            item: _controller.listTopStore[index]);
                      },
                    ),
                  ),
                  SizedBox(height: 7.h),
                  Padding(
                    padding: EdgeInsets.only(left: 10.w),
                    child: Text(
                      "Would you like to go?".tr,
                      style: TextStyle(
                          fontSize: 12.sp, fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(height: 4.h),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    itemCount: _controller.listStore.length,
                    itemBuilder: (context, index) {
                      return ItemStoreWidget(
                          item: _controller.listStore[index]);
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
