import 'package:clean_pattern/common/constant/app_local_storage.dart';
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

// class RefreshTokenInterceptor extends QueuedInterceptorsWrapper {
//   @override
//   void onResponse(Response response, ResponseInterceptorHandler handler) {
//     if (response.data["message"] == "Token is expired") {}
//     super.onResponse(response, handler);
//   }
// }
