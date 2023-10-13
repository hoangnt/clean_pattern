import 'package:clean_pattern/common/constant/status_code.dart';
import 'package:clean_pattern/common/network/model/base_response.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class BaseController extends GetxController {
  Future<void> handleBaseResponse<T>({
    required Future<BaseResponse<T>> usecase,
    String? messageLoading,
    void Function(T)? onSuccess,
    void Function()? onError,
  }) async {
    EasyLoading.show(status: "Loading...");
    final res = await usecase;

    if (res.statusCode != StatusCode.success && onError != null) {
      onError();
    }

    if (onSuccess != null) {
      onSuccess(res.data as T);
    }

    EasyLoading.dismiss();
  }
}
