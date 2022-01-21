import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:lotto_checker/core/lang/locale_keys.g.dart';

import 'search_controller.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    final SearchController controller = Get.put(SearchController());
    return Scaffold(
        body: Center(
            child: ElevatedButton(
                child: const Text("Go to Search"),
                onPressed: () => Get.to(const SearchPage()))),
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add), onPressed: (){}));
  }
}
