import 'package:clean_pattern/common/network/model/base_response.dart';
import 'package:clean_pattern/features/auth/data/model/user_model.dart';

abstract class AuthRepo {
  Future<BaseResponse<Map<String, String>>> login({
    required String email,
    required String password,
  });

  Future<BaseResponse<UserModel?>> getUserProfile();

  Future<BaseResponse<bool?>> logout();

  // Future<BaseResponse<String>> refreshToken({required String refreshToken});
}
