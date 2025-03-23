import 'package:clean_pattern/common/network/model/base_response.dart';
import 'package:clean_pattern/features/auth/data/model/user_model.dart';
import 'package:clean_pattern/features/auth/domain/repositories/auth_repo.dart';

class GetUserProfileUsecase {
  final AuthRepo repo;

  GetUserProfileUsecase(this.repo);

  Future<BaseResponse<UserModel?>> call() async => await repo.getUserProfile();
}
