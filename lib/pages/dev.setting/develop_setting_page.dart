import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:meta_vest_sample/pages/dev.setting/develop_setting_controller.dart';
import '../../routes/app_pages.dart';

class DevelopSettingPage extends StatelessWidget {
  const DevelopSettingPage({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return GetBuilder<DevelopSettingController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(title: Text('개발자 설정 페이지')),
        body: SingleChildScrollView(
            child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: () {
                    Get.toNamed(Routes.Vote);
                  },
                  child: Text('투표')),
              ElevatedButton(
                  onPressed: () {
                    Get.toNamed(Routes.TimeLine);
                  },
                  child: Text('타임라인')),
              ElevatedButton(
                  onPressed: () {
                    Get.toNamed(Routes.BranchSearch);
                  },
                  child: Text('브랜치'))
            ],
          ),
        )),
      );
    });
  }
}