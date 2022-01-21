part of './app_pages.dart';

enum Routes { ROOT, HOME, FEED, SEARCH, RANKING }

extension RotuesExtensions on Routes {
  String get path {
    switch (this) {
      case Routes.ROOT:
        return "/";
      case Routes.HOME:
        return "/home";
      case Routes.FEED:
        return "/feed";
      case Routes.SEARCH:
        return "/search";
      case Routes.RANKING:
        return "/ranking";
    }
  }
}
