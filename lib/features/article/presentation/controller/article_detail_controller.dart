import 'package:clean_pattern/common/controller/base_controller.dart';
import 'package:clean_pattern/features/article/data/model/article_detail_model.dart';
import 'package:clean_pattern/features/article/domain/usecase/get_article_detail_usecase.dart';
import 'package:video_player/video_player.dart';

class ArticleDetailController extends BaseController {
  late VideoPlayerController videoController;
  final GetArticleDetailUsecase getArticleDetailUsecase;

  ArticleDetailController(this.getArticleDetailUsecase);

  ArticleDetailModel? detail;

  @override
  void onInit() async {
    super.onInit();

    await handleBaseResponse(
      usecase: getArticleDetailUsecase(),
      onSuccess: (data) => detail = data,
    );
    videoController = VideoPlayerController.networkUrl(
      Uri.parse(detail!.video!),
      videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
    );
    await videoController.initialize();
    update();

    videoController.addListener(() {
      if (videoController.value.isPlaying) {
        update();
      }

      if (videoController.value.isCompleted) {
        update();
      }
    });
  }

  void playVideo() {
    videoController.play();
  }
}
