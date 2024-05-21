import 'package:get/get.dart';

class HomeController extends GetxController {
  late RxInt tabIndex;

  @override
  void onInit() {
    super.onInit();
    tabIndex = 0.obs;
  }

  void changeTab(int index) {
    tabIndex.value = index;
    update();
  }
}
