import 'package:chewie/chewie.dart';
import 'package:clean_pattern/common/core_ui/app_color.dart';
import 'package:clean_pattern/common/controller/base_controller.dart';
import 'package:clean_pattern/features/article/data/model/article_detail_model.dart';
import 'package:clean_pattern/features/article/domain/usecase/get_article_detail_usecase.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ArticleDetailController extends BaseController {
  late VideoPlayerController videoController;
  late ChewieController chewieController;
  final GetArticleDetailUsecase getArticleDetailUsecase;

  ArticleDetailController(this.getArticleDetailUsecase);

  ArticleDetailModel? detail;

  @override
  void onInit() async {
    super.onInit();

    handleBaseResponse(
      usecase: getArticleDetailUsecase(),
      onSuccess: initDetailData,
    );
  }

  @override
  void onClose() {
    chewieController.dispose();
  }

  Future<void> initDetailData(ArticleDetailModel? data) async {
    detail = data;

    videoController = VideoPlayerController.networkUrl(
      Uri.parse(detail!.video!),
      videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
    );
    await videoController.initialize();
    chewieController = ChewieController(
      videoPlayerController: videoController,
      materialProgressColors: ChewieProgressColors(
        handleColor: Colors.white,
        backgroundColor: AppColor.disable,
        bufferedColor: AppColor.textColor1,
        playedColor: AppColor.primary,
      ),
      cupertinoProgressColors: ChewieProgressColors(
        handleColor: Colors.white,
        backgroundColor: AppColor.disable,
        bufferedColor: AppColor.textColor1,
        playedColor: AppColor.primary,
      ),
    );
  }
}
