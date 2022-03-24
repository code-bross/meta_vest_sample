import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:kt_dart/collection.dart';
import 'package:meta_vest_sample/pages/dev.setting/branch/branch_controller.dart';
import 'package:meta_vest_sample/pages/dev.setting/branch_search/branch_search_controller.dart';

import '../../../routes/app_pages.dart';

class BranchSearchPage extends StatelessWidget {
  const BranchSearchPage({Key? key}) : super(key: key);

  Widget _body(BranchSearchController controller) {
    TextStyle titleTextStyle =
        TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
    TextStyle boldStyle = TextStyle(fontSize: 16, fontWeight: FontWeight.bold);

    Widget _latest(KtList<BranchLatestSearchModel> items) => SizedBox(
          height: 105,
          child: ListView.builder(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: items.size,
              itemBuilder: (BuildContext context, int index) {
                return _LatestSearch(items[index]);
              }),
        );

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
            _latest(controller.items),
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
              body: _body(controller),
            ));
  }
}

class _LatestSearch extends StatelessWidget {
  final BranchLatestSearchModel _model;

  _LatestSearch(this._model);

  TextStyle _titleTextStyle =
      TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
  TextStyle _boldStyle = TextStyle(fontSize: 16, fontWeight: FontWeight.bold);

  @override
  Widget build(context) {
    return GetBuilder<BranchSearchController>(
        builder: (controller) => _widget());
  }

  Widget _widget() {
    return InkWell(
        onTap: () => {Get.toNamed(Routes.Branch)},
        child: Container(
          padding: EdgeInsets.all(8),
          margin: EdgeInsets.only(right: 8),
          decoration: BoxDecoration(
              color: Colors.grey[300], borderRadius: BorderRadius.circular(8)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    _model.title,
                    style: _boldStyle,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(_model.timeString())
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Text(_model.tag),
              Text('새로운 글 ${_model.newCount}개'),
              Row(
                children: [
                  Text(_model.predictionType == PredictionType.Bull
                      ? '상승우세'
                      : '하락우세'),
                  _model.predictionType == PredictionType.Bull
                      ? Icon(
                          Icons.arrow_drop_up_outlined,
                          color: Colors.red,
                        )
                      : Icon(
                          Icons.arrow_drop_down_outlined,
                          color: Colors.blue,
                        )
                ],
              )
            ],
          ),
        ));
  }
}
