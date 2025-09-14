import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:med_task/routes/app_routes.dart';
import '../controllers/article_controller.dart';

class ArticleListView extends StatelessWidget {
  final ArticleController controller = Get.put(ArticleController());

  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();

    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        controller.fetchArticles();
      }
    });

    return Scaffold(
      appBar: AppBar(title: Text("Articles")),
      body: RefreshIndicator(
        onRefresh: () => controller.fetchArticles(refresh: true),
        child: Obx(() {
          if (controller.articles.isEmpty && controller.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
            controller: scrollController,
            itemCount: controller.articles.length +
                (controller.hasMore.value ? 1 : 0),
            itemBuilder: (context, index) {
              if (index < controller.articles.length) {
                final article = controller.articles[index];
                return ListTile(
                  title: Text(article.title),
                  subtitle: Text(article.body, maxLines: 2, overflow: TextOverflow.ellipsis),
                  onTap: () => Get.toNamed(AppRoutes.DETAIL, arguments: article),
                );
              } else {
                // loader at bottom
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(child: CircularProgressIndicator()),
                );
              }
            },
          );
        }),
      ),
    );
  }
}
