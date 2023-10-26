import 'package:clean_pattern/common/network/model/base_response.dart';
import 'package:clean_pattern/features/home/data/model/article_model.dart';
import 'package:clean_pattern/features/home/domain/repositories/article_repo.dart';

class GetAllArticleUsecase {
  final ArticleRepo repo;

  GetAllArticleUsecase(this.repo);

  Future<BaseResponse<List<ArticleModel>>> call() async =>
      await repo.getAllArticle();
}
