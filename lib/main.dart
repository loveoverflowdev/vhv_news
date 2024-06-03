import 'package:app_ui/app_ui.dart' show AppCachedNetworkImage;
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:news_repository/news_repository.dart' show NewsApiEndpoint;
import 'app/app.dart';

void main() async {
  await dotenv.load(fileName: '.env');
  WidgetsBinding _ = WidgetsFlutterBinding.ensureInitialized();
  
  final String domain = dotenv.env['DOMAIN'] ?? 'vustavinhphuc.coquan.vn';
  AppCachedNetworkImage.imageDomain = domain;
  NewsApiEndpoint.domain = domain;
  
  runApp(const App());
}
