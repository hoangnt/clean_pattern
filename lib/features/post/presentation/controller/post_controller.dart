import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:clean_pattern/common/constant/app_color.dart';
import 'package:clean_pattern/common/controller/base_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_painter/flutter_painter.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:image_picker/image_picker.dart';

class PostController extends BaseController {
  PainterController paintController = PainterController();
  FocusNode textFocusNode = FocusNode();

  final GlobalKey captureKey = GlobalKey(debugLabel: "capture");
  final List<Drawable> listDrawable = [];
  bool displayPanel = true;

  // Background
  Color backgroundColor = AppColor.primary;
  File? backgroundImagePath;

  @override
  void onInit() {
    super.onInit();

    Paint shapePaint = Paint()
      ..strokeWidth = 5
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    paintController = PainterController(
      settings: PainterSettings(
        text: TextSettings(
          focusNode: textFocusNode,
          textStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.red,
            fontSize: 18,
          ),
        ),
        freeStyle: const FreeStyleSettings(
          color: Colors.red,
          strokeWidth: 5,
        ),
        shape: ShapeSettings(
          paint: shapePaint,
        ),
        scale: const ScaleSettings(
          enabled: true,
          minScale: 1,
          maxScale: 5,
        ),
      ),
    );
  }

  Future<void> captureWidget() async {
    EasyLoading.show(status: "Processing");
    RenderRepaintBoundary? boundary =
        captureKey.currentContext!.findRenderObject() as RenderRepaintBoundary?;

    if (boundary == null) {
      return;
    }

    ui.Image image = await boundary.toImage();
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);

    if (byteData == null) {
      return;
    }

    Uint8List imageByte = byteData.buffer.asUint8List();
    final result = await ImageGallerySaver.saveImage(imageByte);
    print(result);
    EasyLoading.dismiss();
  }

  void changeColor(Color color) {
    backgroundColor = color;
    update();
  }

  Future<void> changeBackground() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    backgroundImagePath = image != null ? File(image.path) : null;
    update();
  }
}
