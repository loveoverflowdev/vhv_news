import 'package:app_ui/app_ui.dart' show AppCachedNetworkImage;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:vhv_video_player/vhv_video_player.dart';
import 'package:news_repository/news_repository.dart' show NewsApiEndpoint, NewsApiClient;
import 'app/app.dart';

void main() async {
  await dotenv.load(fileName: '.env');
  final cachedDirectory = await getTemporaryDirectory();

  // Network Client Register
  Get.put<NewsApiClient>(NewsApiClient.common(
    dio: Dio(), 
    cachedDirectoryPath: cachedDirectory.path,
  ));
  
  WidgetsBinding _ = WidgetsFlutterBinding.ensureInitialized();
  
  final String domain = dotenv.env['DOMAIN'] ?? 'vustavinhphuc.coquan.vn';
  AppCachedNetworkImage.imageDomain = domain;
  NewsApiEndpoint.domain = domain;
  VhvVideoPlayer.domain = domain;
  
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  
  runApp(const App());
}
