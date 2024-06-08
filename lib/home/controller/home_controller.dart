import 'package:get/get.dart';
import 'package:vhv_news/navigation/navigation.dart' show BottomNavTab;

class HomeController extends GetxController {
  late Rx<BottomNavTab> tab;

  @override
  void onInit() {
    super.onInit();
    tab = BottomNavTab.feed.obs;
  }

  void changeTab(BottomNavTab tab) {
    this.tab.value = tab;
  }
}
