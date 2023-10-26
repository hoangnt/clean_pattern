import 'package:clean_pattern/common/widget/app_elevated_button.dart';
import 'package:clean_pattern/features/post/presentation/controller/post_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_painter/flutter_painter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PostScreen extends StatelessWidget {
  final _controller = Get.find<PostController>();

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
                shadows: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 5,
                    spreadRadius: 4,
                  ),
                ],
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
                Icons.draw_rounded,
                color: _controller.drawColor,
                shadows: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 5,
                    spreadRadius: 4,
                  ),
                ],
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
                actionPanel(),
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
              AppElevatedButton(
                onPressed: _controller.addText,
                text: "add text",
                child: Icon(Icons.abc_outlined, size: 18.sp),
              ),
              SizedBox(width: 10.w),
              AppElevatedButton(
                onPressed: _controller.changeBackground,
                text: "background image picker",
                child: Icon(Icons.image_outlined),
              ),
              SizedBox(width: 10.w),
              AppElevatedButton(
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
                text: "background color picker",
                child: Icon(Icons.color_lens_outlined),
              ),
              SizedBox(width: 10.w),
              AppElevatedButton(
                onPressed: _controller.freeDraw,
                text: "free draw",
                child: Icon(Icons.draw_outlined),
              ),
              SizedBox(width: 10.w),
              AppElevatedButton(
                onPressed: _controller.getHistoryDrawable,
                text: "get history",
                child: Icon(Icons.history),
              ),
              SizedBox(width: 10.w),
              AppElevatedButton(
                onPressed: _controller.undo,
                text: "Undo",
                child: Icon(Icons.undo_outlined),
              ),
              SizedBox(width: 10.w),
              AppElevatedButton(
                onPressed: _controller.captureWidget,
                text: "Capture",
                child: Icon(Icons.save_alt_outlined),
              ),
              SizedBox(width: 10.w),
              AppElevatedButton(
                onPressed: _controller.deleteAll,
                text: "Clear",
                child: Icon(Icons.delete_forever_outlined),
              ),
              SizedBox(width: 10.w),
              AppElevatedButton(
                onPressed: _controller.doneEdit,
                text: "Done",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
