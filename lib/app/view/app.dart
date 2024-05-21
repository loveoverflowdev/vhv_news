import 'package:app_ui/app_ui.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_repository/news_repository.dart';
import 'package:vhv_news/feed/controller/controller.dart';
import 'package:vhv_news/feed/controller/feed_controller.dart';
import 'package:vhv_news/home/controller/home_controller.dart';
import '../../article/article.dart';
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
    Get.put<NewsApiClient>(NewsApiClient(dio: Dio()));

    Get.put<LangsonNewsRepository>(LangsonNewsRepositoryImpl(
      apiClient: Get.find()),
    );

    // Controllers
    Get.put<HomeController>(HomeController());
    Get.put<FeedController>(FeedController(newsRepository: Get.find()));
    Get.put<ArticleController>(ArticleController(newsRepository: Get.find()));
  }
}
