import 'package:cached_network_image/cached_network_image.dart';
import 'package:clean_pattern/common/widget/app_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageViewScreen extends StatelessWidget {
  const ImageViewScreen({
    required this.imageUrl,
    this.allImage,
    this.index,
  });

  final String imageUrl;
  final List<String>? allImage;
  final int? index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: allImage != null && allImage!.isNotEmpty
          ? PageView.builder(
              controller: PageController(initialPage: index ?? 0),
              itemCount: allImage!.length,
              itemBuilder: (context, index) {
                return singleImage(allImage![index], index);
              },
            )
          : singleImage(imageUrl, null),
    );
  }

  Widget singleImage(String image, int? index) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        Get.back<int?>(result: index);
      },
      child: CachedNetworkImage(
        imageUrl: image,
        errorWidget: (context, _, __) => const Center(
          child: Icon(Icons.error),
        ),
        progressIndicatorBuilder: (_, __, progress) => Container(
          color: Colors.black,
          child: AppProgressIndicator(progress.progress),
        ),
        imageBuilder: (context, imageProvider) => InteractiveViewer(
          maxScale: 3,
          child: Container(
            alignment: Alignment.center,
            child: Image(
              image: imageProvider,
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
      ),
    );
  }
}
