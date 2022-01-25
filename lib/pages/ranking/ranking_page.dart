import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:meta_vest_sample/core/data/response.dart';
import 'package:meta_vest_sample/pages/ranking/ranking_controller.dart';
import 'package:shimmer/shimmer.dart';

class RankingPage extends StatelessWidget {
  const RankingPage({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return GetBuilder<RankingController>(
      builder: (controller) {
        return Scaffold(body: RankingListView(controller));
      },
    );
  }
}

class RankingListView extends StatelessWidget {
  final RankingController controller;

  const RankingListView(this.controller, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: controller.list.length,
      itemBuilder: (BuildContext context, int index) {
        var item = controller.list[index];
        switch (item.status) {
          case Status.Success:
            return ListTile(
                title: Text('$index'), onTap: () => controller.load());
          case Status.Error:
            return const Text('error...');
          case Status.Init:
          case Status.Loading:
            return Shimmer.fromColors(
                child:
                    ListTile(title: const Text('loading....'), onTap: () => {}),
                baseColor: Colors.red,
                highlightColor: Colors.yellow);
        }
      },
    );
  }
}
