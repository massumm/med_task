import 'package:get/get_navigation/src/routes/get_route.dart';

import '../views/article_details_view.dart';
import '../views/article_list_view.dart';
import '../views/login_view.dart';
import 'app_routes.dart';

class AppPages{
  static final pages = [
    GetPage(name: AppRoutes.LOGIN, page: () => LoginScreen()),
    GetPage(name: AppRoutes.HOME, page: () => ArticleListView()),
    GetPage(name: AppRoutes.DETAIL, page: () => ArticleDetailsView()),
    ];
}