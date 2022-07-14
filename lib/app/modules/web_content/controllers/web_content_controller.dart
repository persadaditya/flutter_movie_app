import 'package:get/get.dart';
import 'package:pop_movie_app/app/core/base/base_controller.dart';

class WebContentController extends BaseController {

  final count = 0.obs;

  final url = Get.arguments;

  @override
  void onInit() {

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    //TODO
  }

  void increment() => count.value++;
}
