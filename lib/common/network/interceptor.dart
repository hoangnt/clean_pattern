import 'package:clean_pattern/common/utilities/local_secure_storage_util.dart';
import 'package:clean_pattern/common/constant/status_code.dart';
import 'package:clean_pattern/common/utilities/toast_message_util.dart';
import 'package:clean_pattern/features/auth/data/repositories/auth_repo_impl.dart';
import 'package:clean_pattern/features/auth/domain/repositories/auth_repo.dart';
import 'package:clean_pattern/features/settings/presentation/controller/settings_controller.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' as getx;

class TokenInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final accessToken = await LocalSecureStorageUtil.instance.getAccessToken();
    options.headers.addAll({"Authorization": 'Bearer $accessToken'});
    super.onRequest(options, handler);
  }
}

class ConnectionInterceptor extends QueuedInterceptorsWrapper {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final List<ConnectivityResult> connection =
        await Connectivity().checkConnectivity();

    if (!connection.any((val) =>
        val == ConnectivityResult.mobile || val == ConnectivityResult.wifi)) {
      ToastMessageUtil.show(
        getx.Get.context!,
        message: "No internet connection !",
      );
      return handler.resolve(
        Response(requestOptions: options, data: null),
      );
    }

    super.onRequest(options, handler);
  }
}

class RefreshTokenInterceptor extends QueuedInterceptorsWrapper {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final refreshToken =
        await LocalSecureStorageUtil.instance.getRefreshToken();
    if (err.response?.statusCode == StatusCode.unauthorized &&
        refreshToken != null &&
        refreshToken.isNotEmpty) {
      final AuthRepo authRepo = AuthRepoImpl();
      final refreshToken =
          await LocalSecureStorageUtil.instance.getRefreshToken();
      final res = await authRepo.refreshToken(refreshToken: refreshToken!);

      // Refresh token expired
      if (res.statusCode == StatusCode.unauthorized) {
        getx.Get.find<SettingsController>().logout();
        return handler.resolve(err.response!);
      }

      // Refresh token success
      if (res.statusCode == StatusCode.success) {
        await Future.wait([
          LocalSecureStorageUtil.instance
              .saveAccessToken(res.data!["accessToken"]!),
          LocalSecureStorageUtil.instance
              .saveRefreshToken(res.data!["refreshToken"]!)
        ]);
      }

      final newAccessToken =
          await LocalSecureStorageUtil.instance.getAccessToken();
      err.requestOptions.headers.clear();
      err.requestOptions.headers
          .addAll({"Authorization": 'Bearer $newAccessToken'});

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
