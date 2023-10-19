import 'package:clean_pattern/common/constant/app_color.dart';
import 'package:clean_pattern/features/post/presentation/controller/post_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_painter/flutter_painter.dart';
import 'package:get/get.dart';

class PostScreen extends StatelessWidget {
  final _controller = Get.find<PostController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Share your Ramen"),
      ),
      body: FlutterPainter.builder(
        controller: _controller.paintController,
        builder: (context, painter) {
          return Container(
            width: double.infinity,
            color: AppColor.primary,
            child: Stack(
              children: [
                painter,
                ElevatedButton(
                  onPressed: () {
                    if (_controller.paintController.freeStyleMode !=
                        FreeStyleMode.none) {
                      _controller.paintController.freeStyleMode =
                          FreeStyleMode.none;
                    }
                    _controller.paintController.addText();
                  },
                  child: Text("add text"),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
