import 'package:clean_pattern/common/widget/app_elevated_button.dart';
import 'package:clean_pattern/config/routes.dart';
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
                  Row(
                    children: [
                      SizedBox(width: 15.w),
                      Text(
                        "Top 10 on 10",
                        style: TextStyle(
                            fontSize: 12.sp, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(width: 10.w),
                      AppElevatedButton(
                        onPressed: () {
                          Get.toNamed(Routes.post);
                        },
                        text: "Go to Post",
                      ),
                    ],
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 0.2.sh,
                    child: ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
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
                    padding: EdgeInsets.only(left: 15.w),
                    child: Text(
                      "Would you like to go?",
                      style: TextStyle(
                          fontSize: 12.sp, fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(height: 4.h),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
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
