import 'package:easy_localization/easy_localization.dart';
import 'package:jiffy/jiffy.dart';

class FeedModel {
  final String name;
  final DateTime time;
  final List<String> tags;
  final String content;
  final String transaction;
  final String imageUrl;

//<editor-fold desc="Data Methods">

  const FeedModel({
    required this.name,
    required this.time,
    required this.tags,
    required this.content,
    required this.transaction,
    required this.imageUrl,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FeedModel &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          time == other.time &&
          tags == other.tags &&
          content == other.content &&
          transaction == other.transaction &&
          imageUrl == other.imageUrl);

  @override
  int get hashCode =>
      name.hashCode ^
      time.hashCode ^
      tags.hashCode ^
      content.hashCode ^
      transaction.hashCode ^
      imageUrl.hashCode;

  @override
  String toString() {
    return 'FeedModel{' +
        ' name: $name,' +
        ' time: $time,' +
        ' tags: $tags,' +
        ' content: $content,' +
        ' transaction: $transaction,' +
        ' imageUrl: $imageUrl,' +
        '}';
  }

  FeedModel copyWith({
    String? name,
    DateTime? time,
    List<String>? tags,
    String? content,
    String? transaction,
    String? imageUrl,
  }) {
    return FeedModel(
      name: name ?? this.name,
      time: time ?? this.time,
      tags: tags ?? this.tags,
      content: content ?? this.content,
      transaction: transaction ?? this.transaction,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'time': this.time,
      'tags': this.tags,
      'content': this.content,
      'transaction': this.transaction,
      'imageUrl': this.imageUrl,
    };
  }

  factory FeedModel.fromMap(Map<String, dynamic> map) {
    return FeedModel(
      name: map['name'] as String,
      time: map['time'] as DateTime,
      tags: map['tags'] as List<String>,
      content: map['content'] as String,
      transaction: map['transaction'] as String,
      imageUrl: map['imageUrl'] as String,
    );
  }

//</editor-fold>
}

extension FeedModelExtension on FeedModel{
  String getDateString() => Jiffy(
      DateFormat('yyyy-MM-dd HH:mm').format(time), 'yyyy-MM-dd HH:mm')
      .fromNow();
}