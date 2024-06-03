import 'package:app_ui/app_ui.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_repository/news_repository.dart';

import '../../home/home.dart';
import '../../news/article.dart';
import '../../category/category.dart';
import '../routes/routes.dart' as routes;

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.light,
      theme: const AppTheme().themeData,
      darkTheme: const AppDarkTheme().themeData,
      onGenerateRoute: routes.onGenerateRoute,
      initialBinding: AppBinding(),
    );
  }
}

class AppBinding extends Bindings {
  @override
  void dependencies() {
    // Network Client
    Get.put<NewsApiClient>(NewsApiClient.common(dio: Dio()));

    // Repositories
    Get.put<ArticleRepository>(ArticleRepositoryImpl(
      apiClient: Get.find()),
    );
    Get.put<CategoryRepository>(CategoryRepositoryImpl(
      apiClient: Get.find()),
    );

    // Controllers
    Get.put<HomeController>(HomeController());
    Get.put<ArticlesController>(ArticlesController(articleRepository: Get.find()));
    Get.put<ArticleDetailController>(ArticleDetailController(articleRepository: Get.find()));
    Get.put<CategoryController>(CategoryController(categoryRepository: Get.find()));
  }
}
