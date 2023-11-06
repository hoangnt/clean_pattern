import 'package:clean_pattern/common/controller/base_controller.dart';
import 'package:clean_pattern/features/article/data/model/article_model.dart';
import 'package:clean_pattern/features/article/domain/usecase/get_all_article_usecase.dart';

class ArticleController extends BaseController {
  final GetAllArticleUsecase getAllArticleUsecase;

  ArticleController(this.getAllArticleUsecase);

  List<ArticleModel> listArticle = [];

  @override
  void onInit() async {
    super.onInit();
    fetchData();
  }

  Future<void> fetchData() async {
    handleBaseResponse<List<ArticleModel>>(
      usecase: getAllArticleUsecase(),
      onSuccess: (data) => listArticle = data,
    );
  }
}
