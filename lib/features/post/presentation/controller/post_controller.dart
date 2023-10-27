import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:clean_pattern/common/controller/base_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_painter/flutter_painter.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:image_picker/image_picker.dart';

class PostController extends BaseController {
  PainterController paintController = PainterController();
  FocusNode textFocusNode = FocusNode();

  final GlobalKey captureKey = GlobalKey(debugLabel: "capture");
  final List<Drawable> listDrawable = [];

  // Background
  Color textColor = Colors.black;
  Color drawColor = Colors.red;
  Color backgroundColor = Color(0xfff2d5b6);
  File? backgroundImagePath;

  @override
  void onInit() {
    super.onInit();

    paintController.clearDrawables();

    Paint shapePaint = Paint()
      ..strokeWidth = 5
      ..color = Colors.purple
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    paintController = PainterController(
      settings: PainterSettings(
        text: TextSettings(
          focusNode: textFocusNode,
          textStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: textColor,
            fontSize: 18,
          ),
        ),
        freeStyle: FreeStyleSettings(
          color: drawColor,
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

    Get.snackbar("Notice", "Image saved !",
        backgroundColor: Colors.white, snackPosition: SnackPosition.BOTTOM);
  }

  void doneEdit() {
    paintController.freeStyleMode = FreeStyleMode.none;
  }

  void addText() {
    if (paintController.freeStyleMode != FreeStyleMode.none) {
      paintController.freeStyleMode = FreeStyleMode.none;
    }
    paintController.addText();

    listDrawable.clear();
    listDrawable.addAll(paintController.drawables);
  }

  void changeTextColor(Color color) {
    textColor = color;
    paintController.textStyle =
        paintController.textStyle.copyWith(color: color);
    update();
  }

  void freeDraw() {
    paintController.freeStyleMode =
        paintController.freeStyleMode != FreeStyleMode.draw
            ? FreeStyleMode.draw
            : FreeStyleMode.none;
  }

  void changeDrawColor(Color color) {
    drawColor = color;
    paintController.freeStyleColor = color;
    update();
  }

  Future<void> changeBackground() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    backgroundImagePath = image != null ? File(image.path) : null;
    update();
  }

  void changeBackgroundColor(Color color) {
    backgroundColor = color;
    update();
  }

  void getHistoryDrawable() {
    paintController.addDrawables(listDrawable);
  }

  void undo() {
    if (paintController.canUndo) {
      paintController.undo();
    }
  }

  void deleteAll() {
    if (paintController.drawables.isEmpty) {
      return;
    }

    do {
      paintController.removeLastDrawable();
    } while (paintController.drawables.isNotEmpty);
  }
}
