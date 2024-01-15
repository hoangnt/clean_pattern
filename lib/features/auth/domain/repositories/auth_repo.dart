import 'package:clean_pattern/common/network/model/base_response.dart';
import 'package:clean_pattern/features/auth/data/model/user_model.dart';

abstract class AuthRepo {
  Future<BaseResponse<UserModel?>> login({
    required String email,
    required String password,
  });
}
