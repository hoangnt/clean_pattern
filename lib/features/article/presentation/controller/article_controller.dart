import 'package:clean_pattern/common/controller/base_controller.dart';
import 'package:clean_pattern/features/article/data/model/article_model.dart';
import 'package:clean_pattern/features/article/domain/usecase/get_all_article_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ArticleController extends BaseController {
  final GetAllArticleUsecase getAllArticleUsecase;

  ArticleController(this.getAllArticleUsecase);

  final ScrollController scrollController = ScrollController();
  final double _offset = 100.h;
  RxBool displayScrollToTop = false.obs;

  RxList<ArticleModel> listArticle = RxList<ArticleModel>();
  int _page = 0;

  @override
  void onInit() async {
    super.onInit();
    fetchData();

    scrollController.addListener(() {
      if (scrollController.offset > _offset) {
        displayScrollToTop.value = true;
      } else {
        displayScrollToTop.value = false;
      }

      if (scrollController.offset >=
              scrollController.position.maxScrollExtent &&
          !isLoading.value) {
        onLoad();
      }
      update();
    });
  }

  Future<void> fetchData() async {
    listArticle.clear();
    handleBaseResponse<List<ArticleModel>>(
      showLoading: false,
      usecase: getAllArticleUsecase(),
      onSuccess: (data) => listArticle.value = data,
    );
  }

  Future<void> onLoad() async {
    if (totalPage == 0) {
      return;
    }
    
    if (totalPage != 0 && _page == totalPage) {
      return;
    }

    _page += 1;
    handleBaseResponse<List<ArticleModel>>(
      usecase: getAllArticleUsecase(),
      onSuccess: (data) => listArticle.value += data,
    );
  }

  void removeArticle(int index) {
    listArticle.removeAt(index);
    listArticle.refresh();
  }

  void likeArticle(int index) {
    listArticle[index].isLiked = true;
    listArticle.refresh();
  }

  void dislikeArticle(int index) {
    listArticle[index].isLiked = false;
    listArticle.refresh();
  }
}
