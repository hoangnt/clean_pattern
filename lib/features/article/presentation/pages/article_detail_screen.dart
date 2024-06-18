import 'package:cached_network_image/cached_network_image.dart';
import 'package:chewie/chewie.dart';
import 'package:clean_pattern/common/core_ui/app_style.dart';
import 'package:clean_pattern/common/extensions/datetime_extension.dart';
import 'package:clean_pattern/features/article/presentation/controller/article_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ArticleDetailScreen extends StatelessWidget {
  final _controller =
      Get.find<ArticleDetailController>(tag: Get.parameters["tag"]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.appBarTheme.backgroundColor,
      appBar: AppBar(
        title: Text("Detail of article".tr),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14.w),
        child: SingleChildScrollView(
          child: GetBuilder<ArticleDetailController>(
            tag: Get.parameters["tag"],
            builder: (context) {
              if (_controller.isLoading.value) {
                return const SizedBox();
              }

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SelectableText(
                    _controller.detail!.title!,
                    style: AppTextStyle.w700(20.sp).copyWith(letterSpacing: 2),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    "Author: ${_controller.detail!.author!} - ${_controller.detail!.publishedAt!.toDDMMYYYYString}",
                    style: AppTextStyle.normal(16.sp),
                  ),
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
                          child: SelectableText(
                            _controller.detail!.subTitle!,
                            style: AppTextStyle.normal(14.sp)
                                .copyWith(letterSpacing: 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 12.h),
                  CachedNetworkImage(
                    imageUrl: _controller.detail!.images.first,
                    errorWidget: (context, _, __) => const Icon(Icons.error),
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
                  SelectableText(
                    _controller.detail!.content!,
                    style: AppTextStyle.normal(16.sp),
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
                  SelectableText(
                    _controller.detail!.content!,
                    style: AppTextStyle.normal(16.sp),
                  ),
                  SizedBox(height: 20.h),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
