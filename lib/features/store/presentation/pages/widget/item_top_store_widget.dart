import 'package:cached_network_image/cached_network_image.dart';
import 'package:clean_pattern/config/routes.dart';
import 'package:clean_pattern/features/store/data/model/store_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ItemTopStoreWidget extends StatelessWidget {
  ItemTopStoreWidget({required this.item, required this.index});

  final StoreModel item;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(
        Routes.storeStory,
        arguments: {
          "data": item,
          "index": index,
        },
      ),
      child: Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),
        width: 80.w,
        decoration: BoxDecoration(
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
          image: DecorationImage(
            image: CachedNetworkImageProvider(item.image!),
            fit: BoxFit.cover,
          ),
        ),
        margin: EdgeInsets.only(right: 10.w),
        child: Text(
          item.name!,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 9.sp,
            color: Colors.white,
            shadows: [
              BoxShadow(
                offset: Offset(3, 3),
                spreadRadius: 1.5,
                blurRadius: 4,
                color: Colors.black.withOpacity(0.8),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
