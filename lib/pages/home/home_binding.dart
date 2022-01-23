import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:meta_vest_sample/pages/feed/feed_controller.dart';
import 'package:meta_vest_sample/pages/ranking/ranking_controller.dart';
import 'home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<FeedController>(() => FeedController());
    Get.lazyPut<RankingController>(() => RankingController());
  }
}
