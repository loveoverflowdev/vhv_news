import 'package:flutter/material.dart';
import 'package:get/get.dart' show Get, Inst, Obx;
import 'package:vhv_news/home/home.dart';

import '../../category/category.dart';
import '../../navigation/navigation.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static MaterialPageRoute<void> route() {
    return MaterialPageRoute(builder: (_) => const HomePage());
  }

  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeController>();
    final categoryController = Get.find<CategoryController>();
    return Scaffold(
      drawer: const NavDrawer(),
      appBar: AppBar(
        title: Obx(
          () => Text(
            // TODO: Localize it
            homeController.tab.value == BottomNavTab.search 
              ? 'Tìm kiếm' 
              : categoryController.selectedCategory.value?.title ?? '',
          ),
        ),
      ),
      body: const HomeView(),
      bottomNavigationBar: Obx(
        () => BottomNavBar(
          currentTab: homeController.tab.value,
          onTap: (index) => homeController.changeTab(index),
        ),
      ),
    );
  }
}
