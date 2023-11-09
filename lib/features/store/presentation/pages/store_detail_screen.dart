import 'package:clean_pattern/common/constant/app_asset.dart';
import 'package:clean_pattern/common/constant/app_color.dart';
import 'package:clean_pattern/common/widget/app_elevated_button.dart';
import 'package:clean_pattern/features/store/presentation/controller/store_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class StoreDetailScreen extends StatelessWidget {
  final _controller = Get.find<StoreDetailController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.appBarTheme.backgroundColor,
      appBar: AppBar(
        title: Text("Do you like this?"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _controller.data.name!,
                style: TextStyle(
                  letterSpacing: 2,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text("Owner: ${_controller.data.owner}"),
              SizedBox(height: 5.h),
              IntrinsicHeight(
                child: Row(
                  children: [
                    Container(
                      width: 4.w,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColor.primary,
                        borderRadius: BorderRadius.circular(15.sp),
                      ),
                    ),
                    SizedBox(width: 5.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _storeInfo("Address: ", _controller.data.address!),
                          _storeInfo("Phone: ", _controller.data.phone!),
                          Row(
                            children: [
                              _storeInfo("Rated: ",
                                  _controller.data.rating!.toString()),
                              SizedBox(width: 5.w),
                              Image.asset(AppAsset.star, height: 15.h)
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              ClipRRect(
                borderRadius: BorderRadius.circular(5.sp),
                child: Image.network(_controller.data.image!),
              ),
              SizedBox(height: 25.h),
              Align(
                alignment: Alignment.topCenter,
                child: IntrinsicWidth(
                  child: Column(
                    children: [
                      Text(
                        "Rate this restaurant",
                        style: TextStyle(
                          letterSpacing: 2,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        children: [
                          Image.asset(AppAsset.star, height: 25.h),
                          Obx(
                            () => Expanded(
                              child: SliderTheme(
                                data: SliderThemeData(
                                  overlayShape: SliderComponentShape.noThumb,
                                  trackHeight: 5.h,
                                ),
                                child: Slider.adaptive(
                                  activeColor: AppColor.primary,
                                  inactiveColor:
                                      AppColor.primary.withOpacity(0.4),
                                  min: 0,
                                  max: 5,
                                  divisions: 50,
                                  label: _controller.rate.toStringAsFixed(1),
                                  value: _controller.rate.value,
                                  onChanged: _controller.rating,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      AppElevatedButton(
                        onPressed: () {},
                        text: "Rate",
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _storeInfo(String text, String info) {
    return Wrap(
      children: [
        Text(
          text,
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13.sp),
        ),
        Text(
          info,
          style: TextStyle(letterSpacing: 1, fontSize: 13.sp),
        ),
      ],
    );
  }
}
