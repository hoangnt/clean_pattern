import 'package:clean_pattern/features/post/data/datasource/post_local_datasource.dart';
import 'package:clean_pattern/features/post/domain/repositories/post_repo.dart';

class PostRepoImpl implements PostRepo {
  final PostLocalDatasource local = PostLocalDatasource.instance;

  @override
  Future<void> getDrawHistory() async {}
}
