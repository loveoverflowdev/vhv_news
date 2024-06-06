import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vhv_news/feed/view/feed_view.dart';

import '../controller/controller.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => IndexedStack(
      index: Get.find<HomeController>().tabIndex.value,
      children: const [
        FeedView(),
        Placeholder(),
      ],
    ));
  }
}
