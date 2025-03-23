import 'package:cached_network_image/cached_network_image.dart';
import 'package:clean_pattern/common/core_ui/app_textstyle.dart';
import 'package:clean_pattern/common/widget/app_progress_indicator.dart';
import 'package:clean_pattern/config/routes.dart';
import 'package:clean_pattern/features/store/data/model/store_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ItemStoreWidget extends StatelessWidget {
  const ItemStoreWidget({required this.item});

  final StoreModel item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(Routes.storeDetail, arguments: item),
      child: Container(
        margin: EdgeInsets.only(bottom: 12.h),
        decoration: BoxDecoration(
          color: Get.theme.appBarTheme.backgroundColor,
          border: Border.all(color: const Color(0xffFDFDFD)),
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
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: item.image!,
              errorWidget: (context, _, __) => const Icon(Icons.error),
              progressIndicatorBuilder: (_, __, progress) => Container(
                width: 200.w,
                height: 170.h,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                ),
                child: AppProgressIndicator(progress.progress),
              ),
              imageBuilder: (context, imageProvider) => Container(
                width: 200.w,
                height: 170.h,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(width: 8.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 6.h),
                  Text(
                    item.name!,
                    style: AppTextStyle.w700(16.sp).copyWith(
                      letterSpacing: 1,
                    ),
                  ),
                  Text(
                    "Owner: ${item.owner!}",
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      color: Get.theme.iconTheme.color!.withValues(alpha: 0.6),
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Text("Address: ${item.address!}"),
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        item.bestSeller!,
                        style: AppTextStyle.w500(16.sp).copyWith(
                          color:
                              Get.theme.iconTheme.color!.withValues(alpha: 0.7),
                          shadows: [
                            BoxShadow(
                              offset: const Offset(3, 3),
                              spreadRadius: 1.5,
                              blurRadius: 4,
                              color: Colors.amber.withValues(alpha: 0.5),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "is signature dish",
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          color:
                              Get.theme.iconTheme.color!.withValues(alpha: 0.6),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
