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

  List<ArticleModel> listArticle = [];

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
      update();
    });
  }

  Future<void> fetchData() async {
    handleBaseResponse<List<ArticleModel>>(
      usecase: getAllArticleUsecase(),
      onSuccess: (data) => listArticle = data,
    );
  }

  void likeArticle(int index) {
    listArticle[index].isLiked = true;
    update();
  }

  void dislikeArticle(int index) {
    listArticle[index].isLiked = false;
    update();
  }
}
