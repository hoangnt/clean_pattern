import 'package:cached_network_image/cached_network_image.dart';
import 'package:clean_pattern/common/constant/app_asset.dart';
import 'package:clean_pattern/common/constant/app_color.dart';
import 'package:clean_pattern/common/widget/button/app_elevated_button.dart';
import 'package:clean_pattern/common/widget/app_progress_indicator.dart';
import 'package:clean_pattern/common/widget/image_view_screen.dart';
import 'package:clean_pattern/features/store/presentation/controller/store_detail_controller.dart';
import 'package:clean_pattern/features/store/presentation/pages/widget/store_menu_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class StoreDetailScreen extends StatelessWidget {
  final _controller = Get.find<StoreDetailController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.appBarTheme.backgroundColor,
      appBar: AppBar(
        title: Text("Do you like this?"),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Text(
                    _controller.data.name!,
                    style: TextStyle(
                      letterSpacing: 2,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Text("Owner: ${_controller.data.owner}"),
                ),
                SizedBox(height: 5.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: IntrinsicHeight(
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
                              _storeInfo(
                                  "Address: ", _controller.data.address!),
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
                ),
                SizedBox(height: 10.h),
                (_controller.data.allImage != null &&
                        _controller.data.allImage!.isNotEmpty)
                    ? GetBuilder<StoreDetailController>(builder: (context) {
                        return SizedBox(
                          height: 0.5.sh,
                          child: PageView.builder(
                            onPageChanged: _controller.setCurrentIndexCarousel,
                            controller: _controller.pageController,
                            itemCount: _controller.data.allImage!.length,
                            itemBuilder: (context, index) {
                              return _storeImage(
                                _controller.data.allImage![index],
                                spotlight: _controller.currentIndex == index,
                                allImage: _controller.data.allImage,
                                index: index,
                              );
                            },
                          ),
                        );
                      })
                    : Container(
                        height: 0.5.sh,
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: _storeImage(
                          _controller.data.image!,
                          spotlight: true,
                        ),
                      ),
                SizedBox(
                  height: 20.h,
                ),
                if (_controller.data.allImage != null &&
                    _controller.data.allImage!.isNotEmpty)
                  Center(
                    child: SmoothPageIndicator(
                      controller: _controller.pageController,
                      count: _controller.data.allImage!.length,
                      effect: WormEffect(
                        dotColor: AppColor.primary.withOpacity(0.4),
                        activeDotColor: AppColor.primary,
                        dotWidth: 18,
                        dotHeight: 8,
                      ),
                    ),
                  ),
                SizedBox(height: 15.h),
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
                        SizedBox(height: 5.h),
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
          StoreMenuWidget(),
        ],
      ),
    );
  }

  Widget _storeImage(
    String image, {
    bool? spotlight,
    List<String>? allImage,
    int index = 0,
  }) {
    return GestureDetector(
      onTap: () async {
        int? res = await Get.to<int?>(
          () => ImageViewScreen(
            imageUrl: image,
            allImage: allImage,
            index: index,
          ),
        );

        if (res != null) {
          _controller.pageController.jumpToPage(res);
        }
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        clipBehavior: Clip.hardEdge,
        margin: spotlight != null && spotlight
            ? EdgeInsets.zero
            : EdgeInsets.symmetric(horizontal: 10.w, vertical: 25.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.sp),
        ),
        child: CachedNetworkImage(
          imageUrl: image,
          errorWidget: (context, _, __) => Icon(Icons.error),
          progressIndicatorBuilder: (_, __, progress) => Container(
            color: AppColor.placeHolder,
            child: AppProgressIndicator(progress.progress),
          ),
          imageBuilder: (context, imageProvider) => Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
              ),
            ),
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
