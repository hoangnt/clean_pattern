import 'package:clean_pattern/common/network/model/base_response.dart';
import 'package:clean_pattern/features/home/data/model/article_model.dart';

abstract class ArticleRepo {
  Future<BaseResponse<List<ArticleModel>>> getAllArticle();
}
