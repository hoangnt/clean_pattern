import 'package:cached_network_image/cached_network_image.dart';
import 'package:chewie/chewie.dart';
import 'package:clean_pattern/common/constant/app_color.dart';
import 'package:clean_pattern/common/extensions/string_extension.dart';
import 'package:clean_pattern/features/article/presentation/controller/article_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

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
                  aspectRatio: 1920 / 1080,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5.sp),
                    child: Chewie(controller: _controller.chewieController),
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
}
