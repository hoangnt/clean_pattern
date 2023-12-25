import 'package:clean_pattern/common/constant/app_color.dart';
import 'package:clean_pattern/common/widget/button/app_elevated_button.dart';
import 'package:clean_pattern/common/widget/dialog/custom_dialog.dart';
import 'package:clean_pattern/features/post/presentation/controller/post_controller.dart';
import 'package:flutter/cupertino.dart';
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
              Get.dialog(CustomDialog(
                title: "Choose Text color",
                onAction: Get.back,
                disableActionButton: true,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: ColorPicker(
                    pickerColor: _controller.textColor,
                    onColorChanged: _controller.changeTextColor,
                  ),
                ),
              ));
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
              Get.dialog(CustomDialog(
                title: "Choose Draw color",
                onAction: Get.back,
                disableActionButton: true,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Column(
                    children: [
                      ColorPicker(
                        pickerColor: _controller.drawColor,
                        onColorChanged: _controller.changeDrawColor,
                      ),
                      GetBuilder<PostController>(builder: (context) {
                        return _strokeWidthWidget();
                      })
                    ],
                  ),
                ),
              ));
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
                  Get.dialog(CustomDialog(
                    title: "Choose background color",
                    onAction: Get.back,
                    disableActionButton: true,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: ColorPicker(
                        pickerColor: _controller.backgroundColor,
                        onColorChanged: _controller.changeBackgroundColor,
                      ),
                    ),
                  ));
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

  Widget _strokeWidthWidget() {
    return Row(
      children: [
        Expanded(
          child: Text(
            "Stroke width",
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 11.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Expanded(
          flex: 5,
          child: Row(
            children: [
              Expanded(
                child: CupertinoSlider(
                  activeColor: AppColor.primary,
                  min: 1,
                  max: 50,
                  divisions: 50,
                  value: _controller.drawStrokeWidth,
                  onChanged: _controller.changeDrawStrokeWidth,
                ),
              ),
              Text(
                "${_controller.drawStrokeWidth.toInt()}",
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
