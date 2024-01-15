import 'package:clean_pattern/common/constant/status_code.dart';
import 'package:clean_pattern/common/network/model/base_response.dart';
import 'package:clean_pattern/features/auth/data/datasource/auth_remote_datasource.dart';
import 'package:clean_pattern/features/auth/data/model/user_model.dart';
import 'package:clean_pattern/features/auth/domain/repositories/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDatasource remote = AuthRemoteDatasource.instance;

  @override
  Future<BaseResponse<UserModel?>> login({
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
      data: UserModel.fromJson(res.data),
    );
  }
}
