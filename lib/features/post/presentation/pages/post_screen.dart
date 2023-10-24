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
      ),
      body: FlutterPainter.builder(
        controller: _controller.paintController,
        builder: (context, painter) {
          return RepaintBoundary(
            key: _controller.captureKey,
            child: GetBuilder<PostController>(builder: (_) {
              return Container(
                width: double.infinity,
                color: _controller.backgroundColor,
                child: Stack(
                  children: [
                    painter,
                    actionPanel(),
                  ],
                ),
              );
            }),
          );
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
                onPressed: () {
                  if (_controller.paintController.freeStyleMode !=
                      FreeStyleMode.none) {
                    _controller.paintController.freeStyleMode =
                        FreeStyleMode.none;
                  }
                  _controller.paintController.addText();
        
                  _controller.listDrawable.clear();
                  _controller.listDrawable
                      .addAll(_controller.paintController.drawables);
                },
                child: Text("add text"),
              ),
              SizedBox(width: 10.w),
              ElevatedButton(
                onPressed: () {
                  Get.dialog(
                    AlertDialog(
                      title: const Text('Pick a color!'),
                      actions: [
                        TextButton(
                          child: const Text("Done"),
                          onPressed: () => Get.back(),
                        ),
                      ],
                      content: SingleChildScrollView(
                        child: ColorPicker(
                          pickerColor: _controller.backgroundColor,
                          onColorChanged: _controller.changeColor,
                        ),
                      ),
                    ),
                  );
                },
                child: Text("background color picker"),
              ),
              SizedBox(width: 10.w),
              ElevatedButton(
                onPressed: () {
                  _controller.paintController.freeStyleMode =
                      _controller.paintController.freeStyleMode !=
                              FreeStyleMode.draw
                          ? FreeStyleMode.draw
                          : FreeStyleMode.none;
                },
                child: Text("free draw"),
              ),
              SizedBox(width: 10.w),
              ElevatedButton(
                onPressed: () {
                  _controller.paintController
                      .addDrawables(_controller.listDrawable);
                },
                child: Text("get history"),
              ),
              SizedBox(width: 10.w),
              ElevatedButton(
                onPressed: () {
                  if (_controller.paintController.canUndo) {
                    _controller.paintController.undo();
                  }
                },
                child: Text("Undo"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
