import 'package:cached_network_image/cached_network_image.dart';
import 'package:clean_pattern/config/routes.dart';
import 'package:clean_pattern/features/store/data/model/store_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ItemStoreWidget extends StatelessWidget {
  ItemStoreWidget({required this.item});

  final StoreModel item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(Routes.storeDetail, arguments: item),
      child: Container(
        margin: EdgeInsets.only(bottom: 10.h),
        decoration: BoxDecoration(
          color: Get.theme.appBarTheme.backgroundColor,
          border: Border.all(color: Color(0xffFDFDFD)),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 3),
              spreadRadius: 1.5,
              blurRadius: 4,
              color: Colors.black.withOpacity(0.2),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: item.image!,
              errorWidget: (context, _, __) => Icon(Icons.error),
              imageBuilder: (context, imageProvider) => Container(
                width: 180.w,
                height: 150.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
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
            SizedBox(width: 5.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 5.h),
                  Text(
                    item.name!,
                    style: TextStyle(
                      letterSpacing: 1,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Owner: ${item.owner!}",
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      color: Get.theme.iconTheme.color!.withOpacity(0.6),
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
                        style: TextStyle(
                          color: Get.theme.iconTheme.color!.withOpacity(0.7),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          shadows: [
                            BoxShadow(
                              offset: Offset(3, 3),
                              spreadRadius: 1.5,
                              blurRadius: 4,
                              color: Colors.amber.withOpacity(0.5),
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
                          color: Get.theme.iconTheme.color!.withOpacity(0.6),
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
