import 'package:clean_pattern/common/constant/status_code.dart';
import 'package:clean_pattern/common/network/model/base_response.dart';
import 'package:clean_pattern/features/home/data/datasource/home_remote_datasource.dart';
import 'package:clean_pattern/features/home/data/model/article_model.dart';
import 'package:clean_pattern/features/home/domain/repositories/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeRemoteDatasource remote = HomeRemoteDatasource.instance;

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
}
