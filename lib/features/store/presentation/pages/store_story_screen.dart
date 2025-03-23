import 'package:cached_network_image/cached_network_image.dart';
import 'package:clean_pattern/common/core_ui/app_style.dart';
import 'package:clean_pattern/common/widget/app_progress_indicator.dart';
import 'package:clean_pattern/features/store/presentation/controller/store_story_controller.dart';
import 'package:clean_pattern/generated/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';

class StoreStoryScreen extends StatelessWidget {
  final _controller = Get.find<StoreStoryController>();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: _controller.onBackPhysics,
      child: Scaffold(
        backgroundColor: Colors.black54,
        body: SafeArea(
          child: Stack(
            children: [
              CachedNetworkImage(
                imageUrl: _controller.data.image!,
                errorWidget: (context, _, __) => const Icon(Icons.error),
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
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.3),
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
                            style: AppTextStyle.w600(16.sp).white.copyWith(
                                  letterSpacing: 2,
                                ),
                          ),
                          Text(
                            "Owner: ${_controller.data.owner!}",
                            style: AppTextStyle.normal(14.sp).white,
                          ),
                        ],
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: _controller.onBack,
                        child: Assets.icon.close.image(
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
