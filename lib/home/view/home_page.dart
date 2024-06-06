
import 'package:flutter/material.dart';
import 'package:get/get.dart' show Get, Inst, Obx;
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
        title: Obx(
            () => Text(Get.find<CategoryController>().selectedCategory.value?.title ?? '',
          ),
        ),
      ),
      body: const HomeView(),
    );
  }
}
