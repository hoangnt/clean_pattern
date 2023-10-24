import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:clean_pattern/common/controller/base_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_painter/flutter_painter.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

class PostController extends BaseController {
  PainterController paintController = PainterController();
  FocusNode textFocusNode = FocusNode();

  final GlobalKey captureKey = GlobalKey(debugLabel: "capture");

  final List<Drawable> listDrawable = [];

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
  }
}
