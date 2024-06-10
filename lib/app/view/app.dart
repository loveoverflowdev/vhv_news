import 'package:app_ui/app_ui.dart';
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
  void dependencies() async {    
    // Repositories
    Get.put<ArticleRepository>(RemoteArticleRepository(
      apiClient: Get.find()),
    );
    Get.put<CategoryRepository>(RemoteCategoryRepository(
      apiClient: Get.find()),
    );
    Get.put<LegalDocumentRepository>(RemoteLegalDocumentRepository(
      apiClient: Get.find()),
    );
    Get.put<PhotoAlbumRepository>(RemotePhotoAlbumRepository(
      apiClient: Get.find()),
    );
    Get.put<VideoRepository>(RemoteVideoRepository(
      apiClient: Get.find()),
    );
    Get.put<EmagazineRepository>(RemoteEmagazineRepository(
      apiClient: Get.find()),
    );

    // Controllers
    Get.put<HomeController>(HomeController());
    Get.put<CategoryController>(CategoryController(categoryRepository: Get.find()));
  }
}
