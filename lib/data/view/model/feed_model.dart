import 'package:easy_localization/easy_localization.dart';
import 'package:jiffy/jiffy.dart';

class FeedModel {
  final String name;
  final DateTime time;
  final List<String> tags;
  final String content;
  final String transaction;
  final String imageUrl;

  FeedModel(this.name, this.time, this.tags, this.content, this.transaction,
      this.imageUrl);
}

extension FeedModelExtension on FeedModel{
  String getDateString() => Jiffy(
      DateFormat('yyyy-MM-dd HH:mm').format(time), 'yyyy-MM-dd HH:mm')
      .fromNow();
}