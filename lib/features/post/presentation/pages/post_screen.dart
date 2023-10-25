import 'package:clean_pattern/features/post/presentation/controller/post_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_painter/flutter_painter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PostScreen extends StatelessWidget {
  final _controller = Get.find<PostController>()
    ..paintController.clearDrawables();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Share your Ramen"),
        actions: [
          IconButton(
            icon: GetBuilder<PostController>(builder: (context) {
              return Icon(
                Icons.text_format_rounded,
                color: _controller.textColor,
              );
            }),
            onPressed: () {
              Get.dialog(
                AlertDialog(
                  title: const Text('Choose Text color'),
                  actions: [
                    TextButton(
                      child: const Text("Done"),
                      onPressed: () => Get.back(),
                    ),
                  ],
                  content: SingleChildScrollView(
                    child: ColorPicker(
                      pickerColor: _controller.textColor,
                      onColorChanged: _controller.changeTextColor,
                    ),
                  ),
                ),
              );
            },
          ),
          IconButton(
            icon: GetBuilder<PostController>(builder: (context) {
              return Icon(
                Icons.draw_outlined,
                color: _controller.drawColor,
              );
            }),
            onPressed: () {
              Get.dialog(
                AlertDialog(
                  title: const Text('Choose Draw color'),
                  actions: [
                    TextButton(
                      child: const Text("Done"),
                      onPressed: () => Get.back(),
                    ),
                  ],
                  content: SingleChildScrollView(
                    child: ColorPicker(
                      pickerColor: _controller.drawColor,
                      onColorChanged: _controller.changeDrawColor,
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: FlutterPainter.builder(
        controller: _controller.paintController,
        builder: (context, painter) {
          return GetBuilder<PostController>(builder: (_) {
            return Stack(
              children: [
                RepaintBoundary(
                  key: _controller.captureKey,
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: _controller.backgroundColor,
                      image: _controller.backgroundImagePath != null
                          ? DecorationImage(
                              image:
                                  FileImage(_controller.backgroundImagePath!),
                              fit: BoxFit.cover,
                            )
                          : null,
                    ),
                    child: painter,
                  ),
                ),
                if (_controller.displayPanel) actionPanel(),
              ],
            );
          });
        },
      ),
    );
  }

  Widget actionPanel() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.h, vertical: 10.w),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ElevatedButton(
                onPressed: _controller.addText,
                child: Text("add text"),
              ),
              SizedBox(width: 10.w),
              ElevatedButton(
                onPressed: _controller.changeBackground,
                child: Text("background image picker"),
              ),
              SizedBox(width: 10.w),
              ElevatedButton(
                onPressed: () {
                  Get.dialog(
                    AlertDialog(
                      title: const Text('Choose background color'),
                      actions: [
                        TextButton(
                          child: const Text("Done"),
                          onPressed: () => Get.back(),
                        ),
                      ],
                      content: SingleChildScrollView(
                        child: ColorPicker(
                          pickerColor: _controller.backgroundColor,
                          onColorChanged: _controller.changeBackgroundColor,
                        ),
                      ),
                    ),
                  );
                },
                child: Text("background color picker"),
              ),
              SizedBox(width: 10.w),
              ElevatedButton(
                onPressed: _controller.freeDraw,
                child: Text("free draw"),
              ),
              SizedBox(width: 10.w),
              ElevatedButton(
                onPressed: _controller.getHistoryDrawable,
                child: Text("get history"),
              ),
              SizedBox(width: 10.w),
              ElevatedButton(
                onPressed: _controller.undo,
                child: Text("Undo"),
              ),
              SizedBox(width: 10.w),
              ElevatedButton(
                onPressed: _controller.captureWidget,
                child: Text("Capture"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
