import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:meta_vest_sample/data/view/model/ranking_model.dart';
import 'package:meta_vest_sample/pages/ranking/ranking_controller.dart';

class RankingPage extends StatelessWidget {
  const RankingPage({Key? key}) : super(key: key);

  Widget _widget(MapEntry<String,List<RankingModel>> item) {
    return Column(children: [
      _Header(item.key),
      SizedBox(
          height: 200,
          child: ListView.builder(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: item.value.length,
              itemBuilder: (BuildContext context, int index) {
                return _Chracter(item.value[index]);
              }))
    ]);
  }

  List<Widget> _widgets(RankingController controller) {
    return controller.items.entries.map((item) => Container(child: _widget(item),
      padding: const EdgeInsets.all(10),
    )).toList();
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

class _Bottom extends StatelessWidget {

  final RankingModel _model;
  _Bottom(this._model);

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
        _Bottom(_model)
      ],
    );
  }
}