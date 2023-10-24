import 'package:clean_pattern/features/post/domain/repositories/post_repo.dart';

class GetDrawHistoryUsecase {
  final PostRepo repo;

  GetDrawHistoryUsecase(this.repo);

  Future<void> call() async => repo.getDrawHistory();
}
