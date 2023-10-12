import 'dart:convert';
import 'dart:io';

import 'package:clean_pattern/common/constant/network_code.dart';
import 'package:clean_pattern/common/network/interceptor.dart';
import 'package:clean_pattern/common/network/model/server_response.dart';
import 'package:clean_pattern/config/base_url.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiController {
  static final ApiController _instance = ApiController._();
  ApiController._() {
    _dio = Dio(apiOption);
    _dio.interceptors.addAll([
      TokenInterceptor(),
    ]);
  }
  factory ApiController() => _instance;

  late Dio _dio;
  final BaseOptions apiOption = BaseOptions(
    baseUrl: BaseUrl.getServerUrl(),
    connectTimeout: Duration(seconds: 10),
  );

  Future<ServerResponse> get({
    required String endpoint,
    required Map<String, dynamic> params,
  }) async {
    try {
      final res = await _dio.request(
        endpoint,
        queryParameters: params,
        options: Options(method: "GET"),
      );
      debugPrint('API log request: ${res.statusCode} ${res.realUri}');
      debugPrint('API log params: $params');

      return _handleResponse(res);
    } catch (e) {
      return _handleResponse(null);
    }
  }

  Future<ServerResponse> post({
    required String endpoint,
    required Map<String, dynamic> params,
  }) async {
    try {
      final res = await _dio.request(
        endpoint,
        data: params,
        options: Options(method: "POST"),
      );
      debugPrint('API log request: ${res.statusCode} ${res.realUri}');
      debugPrint('API log params: $params');

      return _handleResponse(res);
    } catch (e) {
      return _handleResponse(null);
    }
  }

  Future<ServerResponse> postWithFile({
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
      final res = await _dio.post(
        "${BaseUrl.getServerUrl()}$endpoint",
        data: params,
        options: Options(method: "POST"),
      );
      debugPrint('API log request: ${res.statusCode} ${res.realUri}');
      debugPrint('API log params: $params');

      return _handleResponse(res);
    } catch (e) {
      return _handleResponse(null);
    }
  }

  ServerResponse _handleResponse(Response? response) {
    if (response == null) {
      return ServerResponse(
        statusCode: NetworkCode.crash,
        message: "Something went wrong !!!",
      );
    }

    Map<String, dynamic>? jsonData = Map<String, dynamic>();
    try {
      jsonData = json.decode(response.data);
    } catch (e) {
      jsonData = null;
    }

    return ServerResponse(
      statusCode: response.statusCode ?? NetworkCode.crash,
      data: jsonData != null ? jsonData["data"] : null,
      message: jsonData != null ? jsonData["message"] : null,
      paging: (jsonData != null && jsonData["paging"] != null)
          ? Paging.fromJson(jsonData["paging"])
          : null,
    );
  }
}
