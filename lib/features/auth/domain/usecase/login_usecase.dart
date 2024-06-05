import 'package:clean_pattern/common/network/model/base_response.dart';
import 'package:clean_pattern/features/auth/domain/repositories/auth_repo.dart';

class LoginUsecase {
  final AuthRepo repo;

  LoginUsecase(this.repo);

  Future<BaseResponse<Map<String, dynamic>?>> call({
    required String email,
    required String password,
  }) async =>
      await repo.login(
        email: email,
        password: password,
      );
}
