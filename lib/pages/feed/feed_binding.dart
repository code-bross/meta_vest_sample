import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:meta_vest_sample/pages/feed/feed_controller.dart';

class FeedBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FeedController>(() {
      return FeedController();
    });
  }
}
