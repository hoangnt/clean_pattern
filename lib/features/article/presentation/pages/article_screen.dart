import 'package:clean_pattern/common/core_ui/app_style.dart';
import 'package:clean_pattern/common/widget/app_empty_data_widget.dart';
import 'package:clean_pattern/common/widget/button/app_scroll_to_top_button.dart';
import 'package:clean_pattern/features/article/presentation/controller/article_controller.dart';
import 'package:clean_pattern/features/article/presentation/pages/widget/article_item_loading_widget.dart';
import 'package:clean_pattern/features/article/presentation/pages/widget/article_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ArticleScreen extends StatelessWidget {
  final _controller = Get.find<ArticleController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Obx(() {
        return AnimatedCrossFade(
          duration: const Duration(milliseconds: 300),
          firstChild: AppScrollToTopButton(
            controller: _controller.scrollController,
          ),
          secondChild: SizedBox(
            width: 45.w,
            height: 45.w,
          ),
          crossFadeState: _controller.displayScrollToTop.value
              ? CrossFadeState.showFirst
              : CrossFadeState.showSecond,
        );
      }),
      body: Obx(
        () {
          if (_controller.isLoading.value && _controller.listArticle.isEmpty) {
            return ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => ArticleItemLoadingWidget(),
              itemCount: 3,
            );
          }

          if (!_controller.isLoading.value && _controller.listArticle.isEmpty) {
            return AppEmptyDataWidget(
              text: "no data",
              onRefresh: _controller.fetchData,
            );
          }

          return RefreshIndicator(
            color: AppColor.primary,
            onRefresh: _controller.fetchData,
            child: ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              controller: _controller.scrollController,
              itemCount: _controller.listArticle.length,
              itemBuilder: (context, index) {
                return ArticleItemWidget(
                  data: _controller.listArticle[index],
                  index: index,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
