import 'dart:async';

import 'package:clean_pattern/common/constant/status_code.dart';
import 'package:clean_pattern/common/network/model/base_response.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class BaseController extends GetxController {
  bool isLoading = false;

  Future<void> handleBaseResponse<T>({
    required Future<BaseResponse<T>> usecase,
    String? messageLoading,
    FutureOr<void> Function(T)? onSuccess,
    void Function(String)? onError,
  }) async {
    isLoading = true;
    EasyLoading.show(status: "Loading...");
    final res = await usecase;

    if (res.statusCode != StatusCode.success && onError != null) {
      onError(res.message ?? "Something went wrong !");
      isLoading = false;
      EasyLoading.dismiss();
      update();
      return;
    }

    if (onSuccess != null) {
      await onSuccess(res.data as T);
    }

    isLoading = false;
    EasyLoading.dismiss();
    update();
  }

  Future<void> handle2BaseResponse<T, E>({
    required List<Future<BaseResponse<T>>> usecases,
    String? messageLoading,
    void Function(T, E)? onSuccess,
    void Function(List<String>)? onError,
    bool needUpdate = true,
  }) async {
    isLoading = true;
    EasyLoading.show(status: "Loading...");

    final res = await Future.wait(usecases);

    if (onError != null &&
        res.any((val) => val.statusCode != StatusCode.success)) {
      List<String> listMessageError = res
          .where((val) => val.statusCode != StatusCode.success)
          .map((val) => val.message ?? "Something went wrong !")
          .toList();
      onError(listMessageError);
    }

    if (onSuccess != null) {
      onSuccess(
        res[0].data as T,
        res[1].data as E,
      );
      isLoading = false;
      EasyLoading.dismiss();
      update();
    }

    isLoading = false;
    EasyLoading.dismiss();
    if (needUpdate) {
      update();
    }
  }

  Future<void> handleMutiUsecaseWithoutData({
    required List<Future<BaseResponse>> usecases,
    String? messageLoading,
    void Function()? onSuccess,
    void Function(List<String>)? onError,
    bool needUpdate = true,
  }) async {
    isLoading = true;
    EasyLoading.show(status: "Loading...");

    final res = await Future.wait(usecases);

    if (onError != null &&
        res.any((val) => val.statusCode != StatusCode.success)) {
      List<String> listMessageError = res
          .where((val) => val.statusCode != StatusCode.success)
          .map((val) => val.message ?? "Something went wrong !")
          .toList();
      onError(listMessageError);
      isLoading = false;
      EasyLoading.dismiss();
      update();
    }

    if (onSuccess != null) {
      onSuccess();
    }

    isLoading = false;
    EasyLoading.dismiss();
    if (needUpdate) {
      update();
    }
  }
}
