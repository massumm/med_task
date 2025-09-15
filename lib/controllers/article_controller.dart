import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:med_task/res/app_urls.dart';
import '../models/article_model.dart';

class ArticleController extends GetxController {
  var articles = <Article>[].obs;
  var page = 1.obs;
  var isLoading = false.obs;
  var hasMore = true.obs;

  final int limit = 10;

  @override
  void onInit() {
    super.onInit();
    fetchArticles();
  }

  Future<void> fetchArticles({bool refresh = false}) async {
    if (refresh) {
      page.value = 1;
      hasMore.value = true;
      articles.clear();
    }

    if (!hasMore.value) return;

    isLoading.value = true;

    final response = await http.get(
      Uri.parse("${AppUrls.articlelistUrl}?_page=${page.value}&_limit=$limit"),
    );

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);

      if (data.isNotEmpty) {
        articles.addAll(data.map((e) => Article.fromJson(e)).toList());
        page.value++;
      } else {
        hasMore.value = false;
      }
    }
    isLoading.value = false;
  }
}
