import 'package:clean_pattern/common/controller/base_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_painter/flutter_painter.dart';

class PostController extends BaseController {
  PainterController paintController = PainterController();
  FocusNode textFocusNode = FocusNode();

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
}
