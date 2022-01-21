import 'package:get/get.dart';
import 'package:lotto_checker/pages/feed/feed_binding.dart';
import 'package:lotto_checker/pages/feed/feed_page.dart';
import 'package:lotto_checker/pages/home/home_binding.dart';
import 'package:lotto_checker/pages/home/home_page.dart';

part './app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
        name: Routes.HOME.path, page: () => HomePage(), binding: HomeBinding()),
    GetPage(
        name: Routes.FEED.path, page: () => const FeedPage(), binding: FeedBinding())
    // GetPage(
    //     name: Routes.DETAILS.path,
    //     page: () => DetailsPage(),
    //     binding: DetailsBinding()),
  ];
}
