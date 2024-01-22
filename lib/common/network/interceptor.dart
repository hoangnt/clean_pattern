import 'package:clean_pattern/common/constant/app_local_storage.dart';
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
          'Bearer ${AppLocalStorage.instance.getAccessToken()}'
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
        refreshToken: AppLocalStorage.instance.getRefreshToken()!,
      );

      if (res.statusCode == StatusCode.success) {
        await AppLocalStorage.instance
            .saveAccessToken(res.data!["accessToken"]!);
        await AppLocalStorage.instance
            .saveRefreshToken(res.data!["refreshToken"]!);
      }
      err.requestOptions.headers.addAll({
        Headers.contentTypeHeader: 'application/json',
        Headers.wwwAuthenticateHeader:
            'Bearer ${AppLocalStorage.instance.getAccessToken()}'
      });

      return handler.resolve(await Dio().fetch(err.requestOptions));
    }

    return handler.next(err);
  }
}
