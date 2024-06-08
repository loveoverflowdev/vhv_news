import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../navigation/navigation.dart' show BottomNavTab;
import '../controller/controller.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final rxTab = Get.find<HomeController>().tab;
    return Obx(() => IndexedStack(
      index: rxTab.value.tabIndex,
      children: BottomNavTab.widgets,
    ));
  }
}
