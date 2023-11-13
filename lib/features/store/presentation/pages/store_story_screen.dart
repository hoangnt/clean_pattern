import 'package:cached_network_image/cached_network_image.dart';
import 'package:clean_pattern/common/constant/app_asset.dart';
import 'package:clean_pattern/common/constant/app_color.dart';
import 'package:clean_pattern/common/widget/app_progress_indicator.dart';
import 'package:clean_pattern/features/store/presentation/controller/store_story_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';

class StoreStoryScreen extends StatelessWidget {
  final _controller = Get.find<StoreStoryController>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _controller.onBackPhysics,
      child: Scaffold(
        backgroundColor: Colors.black54,
        body: SafeArea(
          child: Stack(
            children: [
              CachedNetworkImage(
                imageUrl: _controller.data.image!,
                errorWidget: (context, _, __) => Icon(Icons.error),
                progressIndicatorBuilder: (_, __, progress) {
                  return Container(
                    width: double.infinity,
                    height: double.infinity,
                    color: Colors.transparent,
                    child: AppProgressIndicator(progress.progress),
                  );
                },
                imageBuilder: (context, imageProvider) {
                  _controller.startTimingStory();
                  return Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  );
                },
              ),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () => _controller.goNextStory(),
                  child: SizedBox(
                    height: 1.sh,
                    width: 0.2.sw,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 7.h),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3),
                ),
                child: IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _controller.data.name!,
                            style: TextStyle(
                              color: Colors.white,
                              letterSpacing: 2,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "Owner: ${_controller.data.owner!}",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      InkWell(
                        onTap: _controller.onBack,
                        child: Image.asset(
                          AppAsset.close,
                          height: 30.h,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Obx(
                () => LinearPercentIndicator(
                  animation: true,
                  animateFromLastPercent: true,
                  animationDuration: 1000,
                  percent: _controller.storyTiming.value /
                      (_controller.defaultStoryTime),
                  progressColor: AppColor.primary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
