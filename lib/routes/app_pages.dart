import 'package:get/get.dart';
import 'package:meta_vest_sample/pages/feed/feed_binding.dart';
import 'package:meta_vest_sample/pages/feed/feed_page.dart';
import 'package:meta_vest_sample/pages/home/home_binding.dart';
import 'package:meta_vest_sample/pages/home/home_page.dart';
import 'package:meta_vest_sample/pages/ranking/ranking_binding.dart';
import 'package:meta_vest_sample/pages/ranking/ranking_page.dart';

part './app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: Routes.Home, page: () => const HomePage(), binding: HomeBinding()),
    GetPage(
        name: Routes.Feed,
        page: () => const FeedPage(),
        binding: FeedBinding()),
    GetPage(
        name: Routes.Ranking,
        page: () => const RankingPage(),
        binding: RankingBinding())
    // GetPage(
    //     name: Routes.DETAILS.path,
    //     page: () => DetailsPage(),
    //     binding: DetailsBinding()),
  ];
}
