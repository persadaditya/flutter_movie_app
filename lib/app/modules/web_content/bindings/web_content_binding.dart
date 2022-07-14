import 'package:get/get.dart';

import '../controllers/web_content_controller.dart';

class WebContentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WebContentController>(
      () => WebContentController(),
    );
  }
}
