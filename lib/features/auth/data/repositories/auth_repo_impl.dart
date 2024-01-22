import 'package:clean_pattern/common/constant/status_code.dart';
import 'package:clean_pattern/common/network/model/base_response.dart';
import 'package:clean_pattern/features/auth/data/datasource/auth_remote_datasource.dart';
import 'package:clean_pattern/features/auth/data/model/user_model.dart';
import 'package:clean_pattern/features/auth/domain/repositories/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDatasource remote = AuthRemoteDatasource.instance;

  @override
  Future<BaseResponse<Map<String, String>>> login({
    required String email,
    required String password,
  }) async {
    final res = await remote.login(email: email, password: password);

    if (res.statusCode != StatusCode.success) {
      return BaseResponse(
        statusCode: res.statusCode,
        message: res.message,
        data: null,
      );
    }

    return BaseResponse(
      statusCode: res.statusCode,
      message: res.message,
      data: res.data as Map<String, String>,
    );
  }

  @override
  Future<BaseResponse<UserModel?>> getUserProfile() async {
    final res = await remote.getUserProfile();

    if (res.statusCode != StatusCode.success) {
      return BaseResponse(
        statusCode: res.statusCode,
        message: res.message,
        data: null,
      );
    }

    return BaseResponse(
      statusCode: res.statusCode,
      message: res.message,
      data: UserModel.fromJson(res.data),
    );
  }

  @override
  Future<BaseResponse<bool?>> logout() async {
    final res = await remote.logout();

    if (res.statusCode != StatusCode.success) {
      return BaseResponse(
        statusCode: res.statusCode,
        message: res.message,
        data: null,
      );
    }

    return BaseResponse(
      statusCode: res.statusCode,
      message: res.message,
      data: res.data as bool,
    );
  }

  @override
  Future<BaseResponse<Map<String, String>>> refreshToken({
    required String refreshToken,
  }) async {
    final res = await remote.refreshToken(refreshToken: refreshToken);

    if (res.statusCode != StatusCode.success) {
      return BaseResponse(
        statusCode: res.statusCode,
        message: res.message,
        data: null,
      );
    }

    return BaseResponse(
      statusCode: res.statusCode,
      message: res.message,
      data: res.data as Map<String, String>,
    );
  }
}
