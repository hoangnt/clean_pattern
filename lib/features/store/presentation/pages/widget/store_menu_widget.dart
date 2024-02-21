import 'package:cached_network_image/cached_network_image.dart';
import 'package:clean_pattern/common/constant/app_color.dart';
import 'package:clean_pattern/common/widget/app_progress_indicator.dart';
import 'package:clean_pattern/features/store/data/model/dish_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class StoreMenuWidget extends StatelessWidget {
  final List<DishModel> _listDish = [
    DishModel(
      name: "Ramen",
      image: "https://picsum.photos/520/545",
      price: 5,
    ),
    DishModel(
      name: "Ramen",
      image: "https://picsum.photos/555/544",
      price: 4,
    ),
    DishModel(
      name: "Ramen",
      image: "https://picsum.photos/600/555",
      price: 7.2,
    ),
    DishModel(
      name: "Ramen",
      image: "https://picsum.photos/601/555",
      price: 7.2,
    ),
    DishModel(
      name: "Ramen",
      image: "https://picsum.photos/600/523",
      price: 7.2,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.1,
      minChildSize: 0.05,
      maxChildSize: 0.7,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: Get.theme.scaffoldBackgroundColor,
            border: Border.all(
              color: AppColor.disable.withOpacity(0.5),
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.sp),
              topRight: Radius.circular(15.sp),
            ),
            boxShadow: [
              BoxShadow(
                color: AppColor.disable.withOpacity(0.3),
                spreadRadius: 4,
                blurRadius: 5,
              ),
            ],
          ),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              children: [
                SizedBox(height: 5.h),
                Container(
                  width: 100.w,
                  height: 5.h,
                  decoration: BoxDecoration(
                    color: AppColor.disable,
                    borderRadius: BorderRadius.circular(20.sp),
                  ),
                ),
                Text(
                  "Restaurant's Menu",
                  style: TextStyle(
                    letterSpacing: 2,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 5.h),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: _listDish.length,
                  itemBuilder: (context, index) {
                    return _dishWidget(_listDish[index]);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _dishWidget(DishModel meal) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.w).copyWith(bottom: 10.h),
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      decoration: BoxDecoration(
        color: Get.theme.appBarTheme.backgroundColor,
        borderRadius: BorderRadius.circular(5.sp),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedNetworkImage(
            imageUrl: meal.image!,
            errorWidget: (context, _, __) => Icon(Icons.error),
            progressIndicatorBuilder: (_, __, progress) => Container(
              width: 75.w,
              height: 75.w,
              color: AppColor.placeHolder,
              child: AppProgressIndicator(progress.progress),
            ),
            imageBuilder: (context, imageProvider) => Container(
              width: 75.w,
              height: 75.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3.sp),
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(width: 10.w),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                meal.name!,
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 3.h),
              Text(
                "${meal.price ?? "-"}\$",
                style: TextStyle(fontSize: 17.sp),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
