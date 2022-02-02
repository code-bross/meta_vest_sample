import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:meta_vest_sample/data/view/model/ranking_model.dart';
import 'package:meta_vest_sample/pages/ranking/ranking_controller.dart';
import 'package:meta_vest_sample/pages/ranking/ranking_type.dart';
import 'package:pie_chart/pie_chart.dart';

class RankingPage extends StatelessWidget {
  const RankingPage({Key? key}) : super(key: key);

  Widget _widget(MapEntry<RankingType, List<RankingModel>> item) {
    return Column(children: [
      _Header(item.key.name()),
      SizedBox(
          height: 200,
          child: ListView.builder(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: item.value.length,
              itemBuilder: (BuildContext context, int index) {
                return _content(item.key, item.value[index]);
              }))
    ]);
  }

  Widget _content(RankingType type, RankingModel model) {
    if (type == RankingType.PortpolioSubsribeCount) {
      return _Chart(model);
    } else {
      return _Chracter(model);
    }
  }

  List<Widget> _widgets(RankingController controller) {
    return controller.items.entries
        .map((item) => Container(
              child: _widget(item),
              padding: const EdgeInsets.all(10),
            ))
        .toList();
  }

  @override
  Widget build(context) {
    return GetBuilder<RankingController>(
      builder: (controller) {
        return Scaffold(
            body: SingleChildScrollView(
                child: Column(
          mainAxisSize: MainAxisSize.min,
          children: _widgets(controller),
        )));
      },
    );
  }
}

class _Header extends StatelessWidget {
  final String _text;

  _Header(this._text);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
            padding: EdgeInsets.only(right: 20),
            child: Text(
              _text,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            )),
        Padding(
            padding: EdgeInsets.only(right: 10),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Colors.red)),
              child: Text(
                'BEST',
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
            )),
        Padding(
            padding: EdgeInsets.only(right: 20),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Colors.orange)),
              child: Text(
                'Weekly',
                style: TextStyle(
                    color: Colors.orange, fontWeight: FontWeight.bold),
              ),
            ))
      ],
    );
  }
}

class _Avatar extends StatelessWidget {
  final RankingModel _model;

  _Avatar(this._model);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.topLeft,
        child: SizedBox(
          width: 150,
          height: 150,
          child: Stack(
            children: [
              Container(
                width: 150,
                height: 150,
                child: Image.network(
                  _model.imageUrl,
                  width: 120,
                  height: 120,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                alignment: Alignment.topLeft,
                child: Text(
                  '${_model.rank}',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
              )
            ],
          ),
        ));
  }
}

class _Chart extends StatelessWidget {
  final RankingModel _model;

  _Chart(this._model);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            alignment: Alignment.topLeft,
            child: SizedBox(
              width: 200,
              height: 120,
              child: Stack(
                children: [
                  SizedBox(
                    width: 160,
                    height: 120,
                    child: PieChart(
                      dataMap: _model.investedInfoMap,
                      chartValuesOptions: ChartValuesOptions(
                        showChartValuesInPercentage: true,
                        chartValueBackgroundColor: Colors.transparent,
                        showChartValuesOutside: false,
                      ),
                      legendOptions: LegendOptions(
                          showLegendsInRow: false, showLegends: false),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    alignment: Alignment.topLeft,
                    child: Text(
                      '${_model.rank}',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                  )
                ],
              ),
            )),
        _ChartBottom(_model)
      ],
    );
  }
}

class _ChartBottom extends StatelessWidget {
  final RankingModel _model;

  _ChartBottom(this._model);

  var plusStyle =
      TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 13);

  var minusStyle =
      TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 13);

  Widget _tags() {
    var text = _model.investedInfoMap.keys.map((e) => '#$e').join(' ');

    return Text(text, overflow: TextOverflow.ellipsis, maxLines: 2,);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(Icons.show_chart),
            Text('수익률'),
            Text(_model.earningRateString(), style: plusStyle),
          ],
        ),
        SizedBox(width: 120, height: 35, child: _tags())
      ],
    );
  }
}

class _CharacterBottom extends StatelessWidget {
  final RankingModel _model;

  _CharacterBottom(this._model);

  var plusStyle =
      TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 13);

  var minusStyle =
      TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 13);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(Icons.show_chart),
            Text('수익률'),
            Text(_model.earningRateString(), style: plusStyle),
          ],
        ),
        Row(
          children: [
            Icon(Icons.stacked_line_chart),
            Text('샤프지수'),
            Text(_model.sharpeRateString(), style: minusStyle),
          ],
        )
      ],
    );
  }
}

class _Chracter extends StatelessWidget {
  final RankingModel _model;

  _Chracter(this._model);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: _Avatar(_model),
          alignment: Alignment.topLeft,
        ),
        _CharacterBottom(_model)
      ],
    );
  }
}
