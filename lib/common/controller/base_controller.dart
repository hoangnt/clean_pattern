import 'dart:async';

import 'package:clean_pattern/common/constant/status_code.dart';
import 'package:clean_pattern/common/network/model/base_response.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class BaseController extends GetxController {
  RxBool isLoading = RxBool(false);
  int totalPage = 0;
  int totalRecord = 0;

  Future<void> handleBaseResponse<T>({
    required Future<BaseResponse<T>> usecase,
    String? loadingText,
    bool showLoading = true,
    FutureOr<void> Function(T)? onSuccess,
    void Function(String)? onError,
  }) async {
    isLoading.value = true;
    if (showLoading) {
      EasyLoading.show(status: loadingText ?? "Loading...");
    }
    final res = await usecase;

    if (res.statusCode != StatusCode.success && onError != null) {
      onError(res.message ?? "Something went wrong !");
      isLoading.value = false;
      EasyLoading.dismiss();
      update();
      return;
    }

    if (onSuccess != null) {
      await onSuccess(res.data as T);
    }

    if (res.paging != null) {
      totalPage = res.paging!.totalPages!;
      totalRecord = res.paging!.totalRecords!;
    }

    isLoading.value = false;
    EasyLoading.dismiss();
    update();
  }

  Future<void> handle2BaseResponse<T, E>({
    required List<Future<BaseResponse<T>>> usecases,
    String? loadingText,
    void Function(T, E)? onSuccess,
    void Function(List<String>)? onError,
    bool needUpdate = true,
  }) async {
    isLoading.value = true;
    EasyLoading.show(status: loadingText ?? "Loading...");

    final res = await Future.wait(usecases);

    if (onError != null &&
        res.any((val) => val.statusCode != StatusCode.success)) {
      List<String> listMessageError = res
          .where((val) => val.statusCode != StatusCode.success)
          .map((val) => val.message ?? "Something went wrong !")
          .toList();
      onError(listMessageError);
      return;
    }

    if (onSuccess != null) {
      onSuccess(
        res[0].data as T,
        res[1].data as E,
      );
    }

    isLoading.value = false;
    EasyLoading.dismiss();
    if (needUpdate) {
      update();
    }
  }

  Future<void> handleMutiUsecaseWithoutData({
    required List<Future<BaseResponse>> usecases,
    String? loadingText,
    void Function()? onSuccess,
    void Function(List<String>)? onError,
    bool needUpdate = true,
  }) async {
    isLoading.value = true;
    EasyLoading.show(status: loadingText ?? "Loading...");

    final res = await Future.wait(usecases);

    if (onError != null &&
        res.any((val) => val.statusCode != StatusCode.success)) {
      List<String> listMessageError = res
          .where((val) => val.statusCode != StatusCode.success)
          .map((val) => val.message ?? "Something went wrong !")
          .toList();
      onError(listMessageError);
      isLoading.value = false;
      EasyLoading.dismiss();
      update();
      return;
    }

    if (onSuccess != null) {
      onSuccess();
    }

    isLoading.value = false;
    EasyLoading.dismiss();
    if (needUpdate) {
      update();
    }
  }
}
