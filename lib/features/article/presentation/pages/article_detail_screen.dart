import 'package:cached_network_image/cached_network_image.dart';
import 'package:clean_pattern/common/constant/app_color.dart';
import 'package:clean_pattern/common/extensions/string_extension.dart';
import 'package:clean_pattern/features/article/presentation/controller/article_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class ArticleDetailScreen extends StatelessWidget {
  final _controller = Get.find<ArticleDetailController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.appBarTheme.backgroundColor,
      appBar: AppBar(
        title: Text("Detail of article"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: SingleChildScrollView(
          child: GetBuilder<ArticleDetailController>(builder: (context) {
            if (_controller.isLoading) {
              return SizedBox();
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _controller.detail!.title!,
                  style: TextStyle(
                    letterSpacing: 2,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                    "Author: ${_controller.detail!.author!} - ${_controller.detail!.publishedAt!.toDDMMYYYYString()}"),
                SizedBox(height: 10.h),
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
                        child: Text(
                          _controller.detail!.subTitle!,
                          style: TextStyle(letterSpacing: 1, fontSize: 13.sp),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.h),
                CachedNetworkImage(
                  imageUrl: _controller.detail!.images.first,
                  errorWidget: (context, _, __) => Icon(Icons.error),
                  imageBuilder: (context, imageProvider) => Container(
                    height: 0.5.sh,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  _controller.detail!.content!,
                  style: TextStyle(fontSize: 12.sp),
                ),
                SizedBox(height: 10.h),
                AspectRatio(
                  aspectRatio: _controller.videoController.value.aspectRatio,
                  child: GestureDetector(
                    onTap: _controller.playVideo,
                    behavior: HitTestBehavior.translucent,
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(5.sp),
                          child: VideoPlayer(_controller.videoController),
                        ),
                        if (!_controller.videoController.value.isPlaying)
                          Align(
                            alignment: Alignment.center,
                            child: Icon(
                              Icons.play_arrow_rounded,
                              size: 60.sp,
                            ),
                          ),
                        _videoPlayer(),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  _controller.detail!.content!,
                  style: TextStyle(fontSize: 12.sp),
                ),
                SizedBox(height: 20.h),
              ],
            );
          }),
        ),
      ),
    );
  }

  Widget _videoPlayer() {
    String hour = _controller.videoController.value.position.inHours.toString();
    String minute = _controller.videoController.value.position.inMinutes
        .toString()
        .padLeft(2, "0");
    String second = _controller.videoController.value.position.inSeconds
        .toString()
        .padLeft(2, "0");

    return Align(
      alignment: Alignment.bottomCenter,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: 5.w),
          (_controller.videoController.value.isPlaying)
              ? Icon(Icons.play_arrow_rounded, size: 17.sp)
              : Icon(Icons.pause, size: 17.sp),
          SizedBox(width: 5.w),
          Expanded(
            child: SizedBox(
              height: 10.h,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5.sp),
                child: VideoProgressIndicator(
                  _controller.videoController,
                  allowScrubbing: true,
                  padding: EdgeInsets.zero,
                  colors: VideoProgressColors(
                    backgroundColor: AppColor.disable,
                    bufferedColor: AppColor.textColor1,
                    playedColor: AppColor.primary,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 5.w),
          Text(
            "${hour != "0" ? "$hour :" : ""} $minute : $second",
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(width: 5.w),
        ],
      ),
    );
  }
}
