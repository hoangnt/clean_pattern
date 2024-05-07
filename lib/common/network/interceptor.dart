import 'package:clean_pattern/common/utilities/local_storage_util.dart';
import 'package:clean_pattern/common/constant/status_code.dart';
import 'package:clean_pattern/features/auth/data/repositories/auth_repo_impl.dart';
import 'package:clean_pattern/features/auth/domain/repositories/auth_repo.dart';
import 'package:clean_pattern/features/settings/presentation/controller/settings_controller.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class TokenInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers.addAll({
      "Authorization": 'Bearer ${LocalStorageUtil.instance.getAccessToken()}'
    });
    super.onRequest(options, handler);
  }
}

class RefreshTokenInterceptor extends QueuedInterceptorsWrapper {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.data["message"] == "Token is expired" &&
        LocalStorageUtil.instance.getAccessToken() != null) {
      final AuthRepo authRepo = AuthRepoImpl();
      final res = await authRepo.refreshToken(
        refreshToken: LocalStorageUtil.instance.getRefreshToken()!,
      );

      // Refresh token expired
      if (res.statusCode == StatusCode.unauthorized) {
        Get.find<SettingsController>().logout();
        return handler.resolve(err.response!);
      }

      // Refresh token success
      if (res.statusCode == StatusCode.success) {
        await Future.wait([
          LocalStorageUtil.instance.saveAccessToken(res.data!["accessToken"]!),
          LocalStorageUtil.instance.saveRefreshToken(res.data!["refreshToken"]!)
        ]);
      }

      err.requestOptions.headers.clear();
      err.requestOptions.headers.addAll({
        "Authorization": 'Bearer ${LocalStorageUtil.instance.getAccessToken()}'
      });

      final cloneRequest = await Dio().request(
        err.requestOptions.path,
        data: err.requestOptions.data,
        queryParameters: err.requestOptions.queryParameters,
        options: Options(
          method: err.requestOptions.method.toUpperCase(),
          headers: err.requestOptions.headers,
        ),
      );
      return handler.resolve(cloneRequest);
    }

    return handler.next(err);
  }
}
