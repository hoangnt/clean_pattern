import 'package:cached_network_image/cached_network_image.dart';
import 'package:clean_pattern/common/constant/app_asset.dart';
import 'package:clean_pattern/common/constant/app_color.dart';
import 'package:clean_pattern/common/extensions/datetime_extension.dart';
import 'package:clean_pattern/common/widget/app_empty_data_widget.dart';
import 'package:clean_pattern/common/widget/button/app_scroll_to_top_button.dart';
import 'package:clean_pattern/config/routes.dart';
import 'package:clean_pattern/features/article/data/model/article_model.dart';
import 'package:clean_pattern/features/article/presentation/controller/article_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ArticleScreen extends StatelessWidget {
  final _controller = Get.find<ArticleController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Obx(() {
        return AnimatedCrossFade(
          duration: Duration(milliseconds: 300),
          firstChild: AppScrollToTopButton(
            controller: _controller.scrollController,
          ),
          secondChild: SizedBox(
            width: 45.w,
            height: 45.w,
          ),
          crossFadeState: _controller.displayScrollToTop.value
              ? CrossFadeState.showFirst
              : CrossFadeState.showSecond,
        );
      }),
      body: Obx(
        () {
          if (_controller.isLoading.value && _controller.listArticle.isEmpty) {
            return SizedBox();
          }

          if (!_controller.isLoading.value && _controller.listArticle.isEmpty) {
            return AppEmptyDataWidget(
              text: "no data",
              onRefresh: _controller.fetchData,
            );
          }

          return RefreshIndicator(
            color: AppColor.primary,
            onRefresh: _controller.fetchData,
            child: ListView.builder(
              physics: AlwaysScrollableScrollPhysics(),
              controller: _controller.scrollController,
              itemCount: _controller.listArticle.length,
              itemBuilder: (context, index) {
                return itemArticle(_controller.listArticle[index], index);
              },
            ),
          );
        },
      ),
    );
  }

  Widget itemArticle(ArticleModel item, int index) {
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (_) => _controller.removeArticle(index),
      child: GestureDetector(
        onTap: () async {
          Get.toNamed(Routes.articleDetail);
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 7.h),
          margin: EdgeInsets.symmetric(horizontal: 16).copyWith(top: 12.h),
          decoration: BoxDecoration(
            color: Get.theme.appBarTheme.backgroundColor,
            border: Border.all(color: Color(0xffFDFDFD)),
            borderRadius: BorderRadius.circular(10.sp),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 3),
                spreadRadius: 1.5,
                blurRadius: 4,
                color: Colors.black.withOpacity(0.2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.title!,
                style: TextStyle(
                  letterSpacing: 1,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5.h),
              Text(
                "Author: ${item.author!}",
                style: TextStyle(fontSize: 14.sp),
              ),
              SizedBox(height: 2.h),
              Text(
                "Pubished: ${item.publishedAt!.toDDMMYYYYString()}",
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 14.sp,
                  color: Get.theme.iconTheme.color!.withOpacity(0.6),
                ),
              ),
              SizedBox(height: 2.h),
              Text(
                item.content!,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Get.theme.iconTheme.color!.withOpacity(0.6),
                  fontSize: 14.sp,
                ),
              ),
              SizedBox(height: 5.h),
              CachedNetworkImage(
                imageUrl: item.image!,
                errorWidget: (context, _, __) => Icon(Icons.error),
                imageBuilder: (context, imageProvider) => Container(
                  height: 140.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
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
                    style: TextStyle(fontSize: 18.sp),
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () => _controller.likeArticle(index),
                    icon: Image.asset(
                      AppAsset.like,
                      width: 27.w,
                      color: item.isLiked == true
                          ? AppColor.iconColorBlue
                          : Get.theme.iconTheme.color,
                    ),
                  ),
                  IconButton(
                    onPressed: () => _controller.dislikeArticle(index),
                    icon: Image.asset(
                      AppAsset.dislike,
                      width: 23.w,
                      color: item.isLiked == false
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
