import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:meta_vest_sample/pages/feed/feed_controller.dart';
import 'package:meta_vest_sample/pages/ranking/ranking_controller.dart';

class RankingPage extends StatelessWidget {
  const RankingPage({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    final RankingController controller = Get.put(RankingController());
    return const Scaffold(body: Center(child: Text('ranking')));
  }
}
