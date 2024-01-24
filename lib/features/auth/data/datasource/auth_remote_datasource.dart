import 'package:clean_pattern/common/constant/status_code.dart';
import 'package:clean_pattern/common/network/model/base_response.dart';

class AuthRemoteDatasource {
  static final AuthRemoteDatasource instance = AuthRemoteDatasource._();
  AuthRemoteDatasource._();

  Future<BaseResponse> login({
    required String email,
    required String password,
  }) async {
    await Future.delayed(Duration(milliseconds: 1500));

    if (email == "weloveramen@gmail.com") {
      return BaseResponse(
        statusCode: StatusCode.notFound,
        data: null,
        message: "Special email",
      );
    }

    dynamic data = {
      "data": {
        "accessToken": "this is access token",
        "refreshToken": "this is refresh token",
      },
    };
    return BaseResponse(
      statusCode: StatusCode.success,
      data: data["data"],
      message: null,
    );
  }

  Future<BaseResponse> getUserProfile() async {
    await Future.delayed(Duration(milliseconds: 1500));

    dynamic data = {
      "data": {
        "name": "Nguyen The Nao",
        "email": "nthoang1308@gmail.com",
        "avatarUrl": "https://picsum.photos/1921/1086",
        "birthday": "13/08/1995",
        "gender": 1,
      },
    };
    return BaseResponse(
      statusCode: StatusCode.success,
      data: data["data"],
      message: null,
    );
  }

  Future<BaseResponse> logout() async {
    await Future.delayed(Duration(milliseconds: 1000));
    dynamic data = {
      "data": true,
    };
    return BaseResponse(
      statusCode: StatusCode.success,
      data: data["data"],
      message: null,
    );
  }

  Future<BaseResponse> refreshToken({required String refreshToken}) async {
    await Future.delayed(Duration(milliseconds: 1500));
    dynamic data = {
      "data": {
        "accessToken": "this is access token",
        "refreshToken": "this is refresh token",
      },
    };
    return BaseResponse(
      statusCode: StatusCode.success,
      data: data["data"],
      message: null,
    );
  }
}
