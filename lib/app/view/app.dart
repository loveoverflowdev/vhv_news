import 'package:app_ui/app_ui.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_repository/news_repository.dart';
import '../routes/routes.dart' as routes;

import '../../home/home.dart';
import '../../category/category.dart';

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
    Get.put<ArticleRepository>(ArticleRepository.remote(
      apiClient: Get.find()),
    );
    Get.put<CategoryRepository>(CategoryRepository.remote(
      apiClient: Get.find()),
    );
    Get.put<LegalDocumentRepository>(LegalDocumentRepository.remote(
      apiClient: Get.find()),
    );
    Get.put<PhotoAlbumRepository>(PhotoAlbumRepository.remote(
      apiClient: Get.find()),
    );

    // Controllers
    // TODO: refactor
    Get.put<HomeController>(HomeController());
    Get.put<CategoryController>(CategoryController(categoryRepository: Get.find()));
  }
}
