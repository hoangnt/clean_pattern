import 'package:clean_pattern/common/constant/status_code.dart';
import 'package:clean_pattern/common/network/model/base_response.dart';
import 'package:clean_pattern/features/article/data/datasource/article_remote_datasource.dart';
import 'package:clean_pattern/features/article/data/model/article_detail_model.dart';
import 'package:clean_pattern/features/article/data/model/article_model.dart';
import 'package:clean_pattern/features/article/domain/repositories/article_repo.dart';

class ArticleRepoImpl implements ArticleRepo {
  final ArticleRemoteDatasource remote = ArticleRemoteDatasource.instance;

  @override
  Future<BaseResponse<List<ArticleModel>>> getAllArticle() async {
    final res = await remote.getAllArticle();

    if (res.statusCode != StatusCode.success) {
      return BaseResponse(
        statusCode: res.statusCode,
        message: res.message,
        data: [],
      );
    }

    return BaseResponse(
      statusCode: res.statusCode,
      message: res.message,
      data: res.data != null
          ? (res.data as List).map((val) => ArticleModel.fromJson(val)).toList()
          : [],
    );
  }

  @override
  Future<BaseResponse<ArticleDetailModel?>> getArticleDetail() async {
    final res = await remote.getArticleDetail();

    if (res.statusCode != StatusCode.success) {
      return BaseResponse(
        statusCode: res.statusCode,
        message: res.message,
        data: null,
      );
    }

    return BaseResponse(
      statusCode: res.statusCode,
      message: res.message,
      data: res.data != null ? ArticleDetailModel.fromJson(res.data) : null,
    );
  }
}
