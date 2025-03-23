import 'package:clean_pattern/common/network/model/base_response.dart';
import 'package:clean_pattern/features/auth/domain/repositories/auth_repo.dart';

class LogoutUsecase {
  final AuthRepo repo;

  LogoutUsecase(this.repo);

  Future<BaseResponse<bool?>> call() async => await repo.logout();
}
