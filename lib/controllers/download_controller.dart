import 'dart:io';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:open_filex/open_filex.dart';
import '../utils/notification_service.dart';

class DownloadController extends GetxController {
  var progress = 0.0.obs;
  var isDownloading = false.obs;
  String? filePath;

  Future<void> downloadFile(String url) async {
    try {
      isDownloading.value = true;
      progress.value = 0.0;

      final dir = await getApplicationDocumentsDirectory();
      filePath = "${dir.path}/dummy.pdf";

      Dio dio = Dio();
      await dio.download(
        url,
        filePath,
        onReceiveProgress: (received, total) {
          if (total != -1) {
            progress.value = received / total;
          }
        },
      );

      isDownloading.value = false;

      // Show notification
      await NotificationService.showNotification(
          "Download Complete", "Tap to open file");

      // Optional: auto-open file
      await OpenFilex.open(filePath!);
    } catch (e) {
      isDownloading.value = false;
      Get.snackbar("Error", "Download failed: $e");
    }
  }
}
