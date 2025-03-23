import 'package:clean_pattern/common/network/model/base_response.dart';
import 'package:clean_pattern/features/article/data/model/article_detail_model.dart';
import 'package:clean_pattern/features/article/domain/repositories/article_repo.dart';

class GetArticleDetailUsecase {
  final ArticleRepo repo;

  GetArticleDetailUsecase(this.repo);

  Future<BaseResponse<ArticleDetailModel?>> call() async =>
      await repo.getArticleDetail();
}
