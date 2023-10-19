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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: RefreshIndicator(
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
                        Text(
                          "Top 10 on 10",
                          style: TextStyle(
                              fontSize: 12.sp, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(width: 10.w),
                        ElevatedButton(
                          onPressed: _controller.captureWidget,
                          child: Text("capture widget"),
                        ),
                      ],
                    ),
                    RepaintBoundary(
                      key: _controller.captureKey,
                      child: SizedBox(
                        width: double.infinity,
                        height: 0.2.sh,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: _controller.listTopStore.length,
                          itemBuilder: (context, index) {
                            return ItemTopStoreWidget(
                                item: _controller.listTopStore[index]);
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 7.h),
                    Text(
                      "Would you like to go?",
                      style: TextStyle(
                          fontSize: 12.sp, fontWeight: FontWeight.w500),
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
      ),
    );
  }
}
