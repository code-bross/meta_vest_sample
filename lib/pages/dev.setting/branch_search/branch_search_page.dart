import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:meta_vest_sample/pages/dev.setting/branch_search/branch_search_controller.dart';

import '../../../routes/app_pages.dart';

class BranchSearchPage extends StatelessWidget {
  const BranchSearchPage({Key? key}) : super(key: key);

  Widget _body(BranchSearchController controller) {
    TextStyle titleTextStyle =
        TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
    TextStyle boldStyle = TextStyle(fontSize: 16, fontWeight: FontWeight.bold);

    Widget searchCard(
        BranchSearchController controller, String title, String timesAgo) {
      return InkWell(
          onTap: () => {
            Get.toNamed(Routes.Branch)
          },
          child: Container(
            padding: EdgeInsets.all(8),
            margin: EdgeInsets.only(right: 8),
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(8)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      title,
                      style: boldStyle,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(timesAgo)
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Text('#코스피'),
                Text('새로운 글 10개'),
                Row(
                  children: [
                    Text('하락우세'),
                    Icon(
                      Icons.arrow_drop_down_outlined,
                      color: Colors.blue,
                    )
                  ],
                )
              ],
            ),
          ));
    }

    return Container(
        margin: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Text('최근 조회한 브랜치', style: titleTextStyle),
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(bottom: 8),
            ),
            Row(
              children: [
                searchCard(controller, '셀트리온', '4분전'),
                searchCard(controller, '씨에스윈드', '5분전')
              ],
            ),
            SizedBox(
              height: 24,
            ),
            Text(
              '국내',
              style: titleTextStyle,
            ),
            Container(
                margin: EdgeInsets.only(left: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '국가 지수',
                      style: boldStyle,
                    ),
                    Row(
                      children: [
                        Text('주식 종목', style: boldStyle),
                        SizedBox(
                          width: 12,
                        ),
                        Text('삼성 에스디에스  신한지주  ')
                      ],
                    )
                  ],
                )),
            SizedBox(
              height: 24,
            ),
            Text(
              '해외',
              style: titleTextStyle,
            ),
            Container(
                margin: EdgeInsets.only(left: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '국가 지수',
                      style: boldStyle,
                    ),
                    Row(
                      children: [
                        Text('주식 종목', style: boldStyle),
                        SizedBox(
                          width: 12,
                        ),
                        Text('삼성 에스디에스  신한지주  ')
                      ],
                    )
                  ],
                )),
          ],
        ));
  }

  @override
  Widget build(context) {
    return GetBuilder<BranchSearchController>(
        builder: (controller) => Scaffold(
              appBar: AppBar(
                title: Text('브랜치'),
              ),
              body: _body(controller),
            ));
  }
}
