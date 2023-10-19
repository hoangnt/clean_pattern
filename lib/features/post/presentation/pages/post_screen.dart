import 'package:clean_pattern/common/constant/app_color.dart';
import 'package:clean_pattern/features/post/presentation/controller/post_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostScreen extends StatelessWidget {
  final _controller = Get.find<PostController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Share your Ramen"),
      ),
      body: Container(
        width: double.infinity,
        color: AppColor.primary,
        child: Column(
          children: [
            Text("do it"),
          ],
        ),
      ),
    );
  }
}
