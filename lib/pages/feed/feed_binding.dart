import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:lotto_checker/pages/feed/feed_controller.dart';

class FeedBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FeedController>(() {
      return FeedController();
    });
  }
}
