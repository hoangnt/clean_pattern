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
        "name": "Nguyen The Nao",
        "email": "weloveramen@gmail.com",
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
}
