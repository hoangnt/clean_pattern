import 'package:clean_pattern/common/constant/app_local_storage.dart';
import 'package:dio/dio.dart';

class TokenInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers.addAll({
      Headers.contentTypeHeader: 'application/json',
      Headers.wwwAuthenticateHeader: 'Bearer ${AppLocalStorage.instance.getToken()}'
    });
    super.onRequest(options, handler);
  }
}

class Interceptor1 extends InterceptorsWrapper {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    print("concurency 1");
    print(options.queryParameters);
    await Future.delayed(Duration(seconds: 2));
    super.onRequest(options, handler);
  }
}

class Interceptor2 extends InterceptorsWrapper {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    print("concurency 2");
    print(options.queryParameters);
    await Future.delayed(Duration(seconds: 2));
    super.onRequest(options, handler);
  }
}

class QueueInterceptor1 extends QueuedInterceptorsWrapper {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    print("Queue 1");
    print(options.queryParameters);
    await Future.delayed(Duration(seconds: 2));
    super.onRequest(options, handler);
  }
}

class QueueInterceptor2 extends QueuedInterceptorsWrapper {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    print("Queue 2");
    print(options.queryParameters);
    await Future.delayed(Duration(seconds: 2));
    super.onRequest(options, handler);
  }
}
