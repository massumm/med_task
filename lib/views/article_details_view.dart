import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:med_task/models/article_model.dart';
import 'package:med_task/res/app_urls.dart';

import '../controllers/download_controller.dart';
import '../utils/common_header.dart';

class ArticleDetailsView extends StatelessWidget {
  final Article? article = Get.arguments;
  final DownloadController downloadController = Get.put(DownloadController());
  ArticleDetailsView({super.key, });

  @override
  Widget build(BuildContext context) {

    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonHeader(title: "articleDetails".tr, hideBackButton: false,),
            Text(article?.title ?? '', style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 8.0),
            Text(article?.body ?? 'noContent'.tr),
            SizedBox(height: screenHeight * 0.01),
            Obx(() => LinearProgressIndicator(
              value: downloadController.isDownloading.value
                  ? downloadController.progress.value
                  : null,
            )),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                downloadController.downloadFile(AppUrls.pdfUrl);
              },
              child: Text("Download PDF"),
            ),
          ],
        ),
      ),
    );
  }
}
