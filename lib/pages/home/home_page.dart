import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotto_checker/core/lang/locale_keys.g.dart';
import 'package:lotto_checker/pages/feed/feed_page.dart';
import 'package:lotto_checker/pages/search/search_page.dart';

import 'home_controller.dart';

class HomePage extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List items = <Widget>[const FeedPage(), const SearchPage()];

    return Scaffold(
      body: Center(child: items[controller.selectedIndex.value]),
      bottomNavigationBar: BottomNavigationBar(
          fixedColor: Colors.black,
          currentIndex: controller.selectedIndex.value,
          onTap: _onTap,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: const Icon(Icons.feed), label: tr(LocaleKeys.home)),
            BottomNavigationBarItem(
                icon: const Icon(Icons.search), label: tr(LocaleKeys.search)),
          ]),
      appBar: AppBar(
          title: Obx(() => Text(
              tr(LocaleKeys.app_name))),
          leading: IconButton(
            icon: const Icon(Icons.insights),
            onPressed: () {},
          ),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.notifications))
          ]),
    );
  }

  void _onTap(index) {
    controller.selectedIndex = index;
  }
}
