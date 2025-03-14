import 'dart:io';

import 'package:clean_pattern/common/constant/status_code.dart';
import 'package:clean_pattern/common/network/interceptor.dart';
import 'package:clean_pattern/common/network/model/base_response.dart';
import 'package:clean_pattern/config/base_url.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiController {
  static final ApiController _instance = ApiController._();
  ApiController._() {
    _dio = Dio(apiOption);
    _dio.interceptors.addAll([
      ConnectionInterceptor(),
      TokenInterceptor(),
      RefreshTokenInterceptor(),
    ]);
  }
  factory ApiController() => _instance;

  late Dio _dio;
  final BaseOptions apiOption = BaseOptions(
    baseUrl: BaseUrl.serverUrl,
    connectTimeout: const Duration(seconds: 10),
  );

  Future<BaseResponse> get({
    required String endpoint,
    required Map<String, dynamic> params,
  }) async {
    try {
      debugPrint('API GET request: ${BaseUrl.serverUrl}$endpoint');
      debugPrint('API log params: $params');

      final res = await _dio.request(
        endpoint,
        queryParameters: params,
        options: Options(method: "GET"),
      );

      return _handleResponse(res);
    } catch (e) {
      return _handleResponse(null);
    }
  }

  Future<BaseResponse> post({
    required String endpoint,
    required Map<String, dynamic> params,
  }) async {
    try {
      debugPrint('API POST request: ${BaseUrl.serverUrl}$endpoint');
      debugPrint('API log params: $params');

      final res = await _dio.request(
        endpoint,
        data: params,
        options: Options(method: "POST"),
      );

      return _handleResponse(res);
    } catch (e) {
      return _handleResponse(null);
    }
  }

  Future<BaseResponse> postWithFile({
    required String endpoint,
    required File file,
    Map<String, dynamic>? params,
  }) async {
    try {
      params?.addAll({
        "file": await MultipartFile.fromFile(
          file.path,
          filename: file.path.split("/").last,
        ),
      });

      debugPrint('API POST request: ${BaseUrl.serverUrl}$endpoint');
      debugPrint('API log params: $params');

      final res = await _dio.request(
        endpoint,
        data: params,
        options: Options(method: "POST"),
      );

      return _handleResponse(res);
    } catch (e) {
      return _handleResponse(null);
    }
  }

  BaseResponse _handleResponse(Response? response) {
    if (response == null) {
      debugPrint("==== API call failed ====");
      return BaseResponse(
        statusCode: StatusCode.crash,
        message: "Something went wrong !!!",
      );
    }

    Map<String, dynamic>? jsonData = <String, dynamic>{};
    try {
      jsonData = Map.from(response.data);
    } catch (e) {
      jsonData = null;
    }

    final data = BaseResponse(
      statusCode: response.statusCode ?? StatusCode.crash,
      data: jsonData != null ? jsonData["data"] : null,
      message: jsonData != null ? jsonData["message"] : null,
      paging: (jsonData != null && jsonData["paging"] != null)
          ? Paging.fromJson(jsonData["paging"])
          : null,
    );

    debugPrint(
        "==== Response ${response.statusCode}: ${response.realUri} ====");
    debugPrint("${data.toJson()}");
    debugPrint("==========================================");

    return data;
  }
}
