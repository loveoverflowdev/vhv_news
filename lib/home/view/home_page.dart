
import 'package:flutter/material.dart';
import 'package:get/get.dart' show GetBuilder;
import 'package:vhv_news/home/home.dart';
import 'package:vhv_news/navigation/view/nav_drawer.dart';

import '../../category/category.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static MaterialPageRoute<void> route() {
    return MaterialPageRoute(builder: (_) => const HomePage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavDrawer(),
      appBar: AppBar(
        title: GetBuilder<CategoryController>(
          builder: (controller) {
            return Text(controller.selectedCategory.value?.title ?? '');
          }
        ),
      ),
      body: const HomeView(),
    );
  }
}
