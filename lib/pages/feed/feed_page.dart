import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:meta_vest_sample/data/view/model/feed_model.dart';
import 'package:meta_vest_sample/pages/feed/feed_controller.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return GetBuilder<FeedController>(
        builder: (controller) => Scaffold(
                body: ListView.separated(
              shrinkWrap: true,
              itemCount: controller.items.length,
              itemBuilder: (BuildContext context, int index) {
                return Feed(controller.items[index]);
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider();
              },
            )));
  }
}

class Feed extends StatelessWidget {
  final FeedModel _model;

  Feed(this._model);

  @override
  Widget build(context) {
    return Container(
        child: Padding(
      padding: EdgeInsets.only(top: 16),
      child: Column(
        children: [
          _Header(_model),
          Row(
            children: [
              Image.network(
                _model.imageUrl,
                width: 120,
                height: 120,
              ),
              _ContentText(_model)
            ],
          )
        ],
      ),
    ));
  }
}

class _Header extends StatelessWidget {
  final FeedModel _model;

  _Header(this._model);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 16),
        child: Row(
          children: [
            Text(_model.name,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16)),
            Padding(
                padding: EdgeInsets.only(left: 16),
                child: Text(
                  _model.getDateString(),
                  style: TextStyle(fontSize: 12),
                ))
          ],
        ));
  }
}

class _ContentText extends StatelessWidget {
  final FeedModel _model;

  _ContentText(this._model);

  Widget _getTag(String text) {
    return Flexible(child: _Tag(text));
  }

  List<Widget> _getTagList() =>
      _model.tags.map((text) => _getTag(text)).toList();

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(children: _getTagList()),
        Padding(
            padding: EdgeInsets.only(top: 8),
            child: Text(
              _model.content,
              style: TextStyle(fontSize: 14, color: Colors.black),
              textAlign: TextAlign.start,
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              softWrap: true,
            )),
        Padding(
            padding: EdgeInsets.only(top: 8),
            child: Text(
              _model.transaction,
              style: TextStyle(fontSize: 14, color: Colors.blueAccent),
              textAlign: TextAlign.start,
            ))
      ],
    ));
  }
}

class _Tag extends StatelessWidget {
  final String _text;
  _Tag(this._text);

  final _style = TextStyle(fontSize: 14, color: Colors.blueAccent);

  @override
  Widget build(BuildContext context) {
    return Text(_text, maxLines: 1, style: _style, textAlign: TextAlign.start);
  }
}
