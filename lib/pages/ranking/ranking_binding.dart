import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:meta_vest_sample/pages/ranking/ranking_controller.dart';

class RankingBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RankingController>(() {
      return RankingController();
    });
  }
}
