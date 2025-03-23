import 'package:cached_network_image/cached_network_image.dart';
import 'package:clean_pattern/common/core_ui/app_style.dart';
import 'package:clean_pattern/common/extensions/datetime_extension.dart';
import 'package:clean_pattern/config/routes.dart';
import 'package:clean_pattern/features/article/data/model/article_model.dart';
import 'package:clean_pattern/features/article/presentation/controller/article_controller.dart';
import 'package:clean_pattern/generated/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ArticleItemWidget extends StatelessWidget {
  const ArticleItemWidget({required this.data, required this.index});

  final ArticleModel data;
  final int index;

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ArticleController>();

    return Dismissible(
      key: UniqueKey(),
      onDismissed: (_) => controller.removeArticle(index),
      child: GestureDetector(
        onTap: () async {
          Get.toNamed(Routes.articleDetail);
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 7.h),
          margin:
              const EdgeInsets.symmetric(horizontal: 16).copyWith(top: 12.h),
          decoration: BoxDecoration(
            color: Get.theme.appBarTheme.backgroundColor,
            border: Border.all(color: AppColor.border1),
            borderRadius: BorderRadius.circular(10.sp),
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 3),
                spreadRadius: 1.5,
                blurRadius: 4,
                color: Colors.black.withValues(alpha: 0.2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data.title!,
                style: AppTextStyle.w700(16.sp).copyWith(letterSpacing: 1),
              ),
              SizedBox(height: 5.h),
              Text(
                "Author: ${data.author!}",
                style: AppTextStyle.normal(14.sp),
              ),
              SizedBox(height: 2.h),
              Text(
                "Pubished: ${data.publishedAt!.toDDMMYYYYString}",
                style: AppTextStyle.normal(14.sp).copyWith(
                  fontStyle: FontStyle.italic,
                  color: Get.theme.iconTheme.color!.withValues(alpha: 0.6),
                ),
              ),
              SizedBox(height: 2.h),
              Text(
                data.content!,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyle.normal(14.sp).copyWith(
                  color: Get.theme.iconTheme.color!.withValues(alpha: 0.6),
                ),
              ),
              SizedBox(height: 5.h),
              CachedNetworkImage(
                imageUrl: data.image!,
                errorWidget: (context, _, __) => const Icon(Icons.error),
                imageBuilder: (context, imageProvider) => Container(
                  height: 140.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.sp),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Is this useful ?",
                    style: AppTextStyle.normal(18.sp),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () => controller.likeArticle(index),
                    icon: Assets.icon.like.image(
                      width: 27.w,
                      color: data.isLiked == true
                          ? AppColor.iconColorBlue
                          : Get.theme.iconTheme.color,
                    ),
                  ),
                  IconButton(
                    onPressed: () => controller.dislikeArticle(index),
                    icon: Assets.icon.dislike.image(
                      width: 23.w,
                      color: data.isLiked == false
                          ? AppColor.iconColorRed
                          : Get.theme.iconTheme.color,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
