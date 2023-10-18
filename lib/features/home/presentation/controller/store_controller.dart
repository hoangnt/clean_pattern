import 'dart:io';
import 'dart:typed_data';

import 'package:clean_pattern/common/controller/base_controller.dart';
import 'package:clean_pattern/features/home/data/model/store_model.dart';
import 'package:clean_pattern/features/home/domain/usecase/get_all_store_usecase.dart';
import 'package:clean_pattern/features/home/domain/usecase/get_top_store_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:ui' as ui;

import 'package:path_provider/path_provider.dart';

class StoreController extends BaseController {
  final GetAllStoreUsecase getAllStoreUsecase;
  final GetTopStoreUsecase getTopStoreUsecase;

  StoreController(
    this.getAllStoreUsecase,
    this.getTopStoreUsecase,
  );

  final GlobalKey captureKey = GlobalKey();

  List<StoreModel> listStore = [];
  List<StoreModel> listTopStore = [];

  @override
  void onInit() async {
    super.onInit();

    handleBaseResponse<List<StoreModel>>(
      usecase: getAllStoreUsecase(),
      onSuccess: (data) => listStore = data,
    );
    handleBaseResponse<List<StoreModel>>(
      usecase: getTopStoreUsecase(),
      onSuccess: (data) => listTopStore = data,
    );
  }

  Future<void> refreshData() async {
    handleBaseResponse<List<StoreModel>>(
      usecase: getAllStoreUsecase(),
      onSuccess: (data) => listStore = data,
    );
    handleBaseResponse<List<StoreModel>>(
      usecase: getTopStoreUsecase(),
      onSuccess: (data) => listTopStore = data,
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

    final directory = (await getDownloadsDirectory())!.path;
    Uint8List pngBytes = byteData.buffer.asUint8List();
    File imgFile = File("$directory/screenshot.png");
    // await imgFile.writeAsBytes(pngBytes);
    // print("success");
  }
}
