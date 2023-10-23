import 'package:clean_pattern/features/home/data/model/store_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemTopStoreWidget extends StatelessWidget {
  ItemTopStoreWidget({required this.item});

  final StoreModel item;

  @override
  Widget build(BuildContext context) {
    return Container(
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
          image: NetworkImage(item.image!),
          fit: BoxFit.cover,
        ),
      ),
      margin: EdgeInsets.only(right: 10.w),
      child: Text(
        item.name!,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: 9.sp, color: Colors.white, shadows: [
          BoxShadow(
            offset: Offset(3, 3),
            spreadRadius: 1.5,
            blurRadius: 4,
            color: Colors.black.withOpacity(0.8),
          ),
        ]),
      ),
    );
  }
}
