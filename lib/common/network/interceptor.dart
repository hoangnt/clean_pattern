import 'package:clean_pattern/common/utilities/local_storage_util.dart';
import 'package:clean_pattern/common/constant/status_code.dart';
import 'package:clean_pattern/features/auth/data/repositories/auth_repo_impl.dart';
import 'package:clean_pattern/features/auth/domain/repositories/auth_repo.dart';
import 'package:dio/dio.dart';

class TokenInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers.addAll({
      Headers.contentTypeHeader: 'application/json',
      Headers.wwwAuthenticateHeader:
          'Bearer ${LocalStorageUtil.instance.getAccessToken()}'
    });
    super.onRequest(options, handler);
  }
}

class ExpiredRefreshTokenInterceptor extends QueuedInterceptorsWrapper {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.data["message"] == "Refresh token is expired") {
      return handler.reject(DioException(
        requestOptions: response.requestOptions,
        response: response.data,
      ));
    }
    super.onResponse(response, handler);
  }
}

class RefreshTokenInterceptor extends QueuedInterceptorsWrapper {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.data["message"] == "Token is expired") {
      final AuthRepo authRepo = AuthRepoImpl();
      final res = await authRepo.refreshToken(
        refreshToken: LocalStorageUtil.instance.getRefreshToken()!,
      );

      if (res.statusCode == StatusCode.success) {
        await LocalStorageUtil.instance
            .saveAccessToken(res.data!["accessToken"]!);
        await LocalStorageUtil.instance
            .saveRefreshToken(res.data!["refreshToken"]!);
      }

      err.requestOptions.headers.clear();
      err.requestOptions.headers.addAll({
        Headers.contentTypeHeader: 'application/json',
        Headers.wwwAuthenticateHeader:
            'Bearer ${LocalStorageUtil.instance.getAccessToken()}'
      });

      final cloneRequest = await Dio().request(
        err.requestOptions.path,
        data: err.requestOptions.data,
        queryParameters: err.requestOptions.queryParameters,
      );
      return handler.resolve(cloneRequest);
    }

    return handler.next(err);
  }
}
