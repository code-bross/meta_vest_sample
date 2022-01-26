import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:meta_vest_sample/pages/ranking/ranking_controller.dart';

class RankingPage extends StatelessWidget {
  const RankingPage({Key? key}) : super(key: key);

  List<int> range(start, end) {
    return [for (var i = start; i < end; i += 1) i];
  }

  Widget _widget() {
    return Column(children: [
      _Header(),
      SizedBox(
          height: 200,
          child: ListView.builder(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return _Chracter();
              }))
    ]);
  }

  List<Widget> _widgets() {
    return range(0, 10).map((e) => Container(child: _widget(),
      padding: EdgeInsets.all(10),
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
          children: _widgets(),
        )));
      },
    );
  }
}

class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
            padding: EdgeInsets.only(right: 20),
            child: Text(
              '수익률',
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
                  'https://pbs.twimg.com/media/EGL70oUVAAAwhzz.png',
                  width: 120,
                  height: 120,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                alignment: Alignment.topLeft,
                child: Text(
                  '1',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
              )
            ],
          ),
        ));
  }
}

class _Bottom extends StatelessWidget {
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
            Text('+19.72%', style: plusStyle),
          ],
        ),
        Row(
          children: [
            Icon(Icons.stacked_line_chart),
            Text('샤프지수'),
            Text('+19.72%', style: minusStyle),
          ],
        )
      ],
    );
  }
}

class _Chracter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: _Avatar(),
          alignment: Alignment.topLeft,
        ),
        _Bottom()
      ],
    );
  }
}