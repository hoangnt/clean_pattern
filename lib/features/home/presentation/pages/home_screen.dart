import 'package:cached_network_image/cached_network_image.dart';
import 'package:clean_pattern/common/extensions/string_extension.dart';
import 'package:clean_pattern/features/home/data/model/article_model.dart';
import 'package:clean_pattern/features/home/presentation/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  final _controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: GetBuilder<HomeController>(
          builder: (_) {
            if (_controller.isLoading) {
              return SizedBox();
            }

            return ListView.builder(
              itemCount: _controller.listArticle.length,
              itemBuilder: (context, index) {
                return itemArticle(_controller.listArticle[index]);
              },
            );
          },
        ),
      ),
    );
  }

  Widget itemArticle(ArticleModel item) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      margin: EdgeInsets.only(bottom: 20.h),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Color(0xffFDFDFD)),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: Offset(3, 3),
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
              fontSize: 13.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5.h),
          Text("Author: ${item.author!}"),
          SizedBox(height: 2.h),
          Text(
            "Pubished: ${item.publishedAt!.toDDMMYYYYString()}",
            style: TextStyle(
              fontStyle: FontStyle.italic,
              color: Colors.black.withOpacity(0.6),
            ),
          ),
          SizedBox(height: 2.h),
          Text(
            item.content!,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.black.withOpacity(0.6),
            ),
          ),
          CachedNetworkImage(
            imageUrl: item.image!,
            errorWidget: (context, _, __) => Icon(Icons.error),
            imageBuilder: (context, imageProvider) => Container(
              height: 100.h,
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
        ],
      ),
    );
  }
}
