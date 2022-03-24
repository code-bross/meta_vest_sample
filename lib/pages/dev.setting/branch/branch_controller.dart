import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kt_dart/collection.dart';

class BranchController extends GetxController {
  KtMutableList<Feed> _items = KtMutableList.of(
    Feed(
        createdAt: DateTime.utc(2022, 2, 23, 14, 25),
        content: '씨에스윈드, 종속회사 ASM Industries 지분 추가 취득 결정',
        header: Header(
            contentType: ContentType.News,
            predictionType: PredictionType.Bear,
            tags: []),
        expand: false,
        comment: Comment(
            comment: '독자 경영권 확보했고, 제무제푶 상 매출 올라 갈것',
            thumbsUpcount: 12,
            commentCount: 6)),
    Feed(
        createdAt: DateTime.utc(2022, 2, 23, 14, 23),
        content: '전운에 씨에스윈드, 부각되네.....',
        header: Header(
            contentType: ContentType.News,
            predictionType: PredictionType.Bear,
            tags: []),
        expand: false,
        comment: null),
    Feed(
        createdAt: DateTime.utc(2022, 2, 23, 14, 21),
        content: '러시아 리스크 풍력주 기회',
        header: Header(
            contentType: ContentType.ForeignNews,
            predictionType: PredictionType.Bull,
            tags: []),
        expand: false,
        comment: null),
    Feed(
        createdAt: DateTime.utc(2022, 2, 22, 11, 09),
        content: '평단 5.6 주주입니다. 상방으로 가려면...',
        header: Header(
            contentType: ContentType.Comment,
            predictionType: PredictionType.Bull,
            tags: ['#주주인증']),
        expand: false,
        comment: Comment(
            comment:
            '거래량은 한 번 터져야 된다고 생각합니다.\n몇 달 째 연이은 하락으로 조금씩 매수를 해나가고 있습니다.',
            thumbsUpcount: 12,
            commentCount: 6)),
  );

  KtList<Feed> get items {
    return _items;
  }

  KtMap<String, KtList<Feed>> get group {
    return items
        .sortedByDescending((p0) => p0.createdAt)
        .groupBy((it) => '${it.createdAt.month}/${it.createdAt.day}');
  }

  @override
  void onInit() {
    super.onInit();
  }

  void expand(int parentIndex, Feed feed) {
    var index = items.indexOf(feed);
    _items[index] = feed.copyWith(expand: !feed.expand);
    update();
  }

  void add() {
    _items.add(Feed(
        createdAt: DateTime.now(),
        content: '아이템 추가',
        header: Header(
            contentType: ContentType.Comment,
            predictionType: PredictionType.Bear,
            tags: []),
        expand: false,
        comment: Comment(comment: '추가', thumbsUpcount: 12, commentCount: 6)));
    update();
  }
}

class Content {
  final String title;
  final List<Feed> feeds;

//<editor-fold desc="Data Methods">

  const Content({
    required this.title,
    required this.feeds,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          (other is Content &&
              runtimeType == other.runtimeType &&
              title == other.title &&
              feeds == other.feeds);

  @override
  int get hashCode => title.hashCode ^ feeds.hashCode;

  @override
  String toString() {
    return 'Content{' + ' title: $title,' + ' messages: $feeds,' + '}';
  }

  Content copyWith({
    String? title,
    List<Feed>? messages,
  }) {
    return Content(
      title: title ?? this.title,
      feeds: messages ?? this.feeds,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': this.title,
      'messages': this.feeds,
    };
  }

  factory Content.fromMap(Map<String, dynamic> map) {
    return Content(
      title: map['title'] as String,
      feeds: map['messages'] as List<Feed>,
    );
  }

//</editor-fold>
}

class Feed {
  final DateTime createdAt; // final DateTime createdAt;
  final String content;
  final Header header;
  final bool expand;
  final Comment? comment;

  String timeString() => DateFormat('HH:mm').format(createdAt);

//<editor-fold desc="Data Methods">

  const Feed({
    required this.createdAt,
    required this.content,
    required this.header,
    required this.expand,
    required this.comment,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          (other is Feed &&
              runtimeType == other.runtimeType &&
              createdAt == other.createdAt &&
              content == other.content &&
              header == other.header &&
              expand == other.expand &&
              comment == other.comment);

  @override
  int get hashCode =>
      createdAt.hashCode ^
      content.hashCode ^
      header.hashCode ^
      expand.hashCode ^
      comment.hashCode;

  @override
  String toString() {
    return 'Feed{' +
        ' createdAt: $createdAt,' +
        ' content: $content,' +
        ' header: $header,' +
        ' expand: $expand,' +
        ' comment: $comment,' +
        '}';
  }

  Feed copyWith({
    DateTime? createdAt,
    String? content,
    Header? header,
    bool? expand,
    Comment? comment,
  }) {
    return Feed(
      createdAt: createdAt ?? this.createdAt,
      content: content ?? this.content,
      header: header ?? this.header,
      expand: expand ?? this.expand,
      comment: comment ?? this.comment,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'createdAt': this.createdAt,
      'content': this.content,
      'header': this.header,
      'expand': this.expand,
      'comment': this.comment,
    };
  }

  factory Feed.fromMap(Map<String, dynamic> map) {
    return Feed(
      createdAt: map['createdAt'] as DateTime,
      content: map['content'] as String,
      header: map['header'] as Header,
      expand: map['expand'] as bool,
      comment: map['comment'] as Comment,
    );
  }

//</editor-fold>
}

class Header {
  final ContentType contentType;
  final PredictionType predictionType;
  final List<String> tags;

//<editor-fold desc="Data Methods">

  const Header({
    required this.contentType,
    required this.predictionType,
    required this.tags,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          (other is Header &&
              runtimeType == other.runtimeType &&
              contentType == other.contentType &&
              predictionType == other.predictionType &&
              tags == other.tags);

  @override
  int get hashCode =>
      contentType.hashCode ^
      predictionType.hashCode ^
      tags.hashCode;

  @override
  String toString() {
    return 'Header{' +
        ' contentType: $contentType,' +
        ' predictionType: $predictionType,' +
        ' tags: $tags,' +
        '}';
  }

  Header copyWith({
    String? title,
    ContentType? contentType,
    PredictionType? predictionType,
    List<String>? tags,
  }) {
    return Header(
      contentType: contentType ?? this.contentType,
      predictionType: predictionType ?? this.predictionType,
      tags: tags ?? this.tags,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'contentType': this.contentType,
      'predictionType': this.predictionType,
      'tags': this.tags,
    };
  }

  factory Header.fromMap(Map<String, dynamic> map) {
    return Header(
      contentType: map['contentType'] as ContentType,
      predictionType: map['predictionType'] as PredictionType,
      tags: map['tags'] as List<String>,
    );
  }

//</editor-fold>
}

class Comment {
  final String comment;
  final int commentCount;
  final int thumbsUpcount;

//<editor-fold desc="Data Methods">

  const Comment({
    required this.comment,
    required this.commentCount,
    required this.thumbsUpcount,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          (other is Comment &&
              runtimeType == other.runtimeType &&
              comment == other.comment &&
              commentCount == other.commentCount &&
              thumbsUpcount == other.thumbsUpcount);

  @override
  int get hashCode =>
      comment.hashCode ^ commentCount.hashCode ^ thumbsUpcount.hashCode;

  @override
  String toString() {
    return 'Comment{' +
        ' comment: $comment,' +
        ' commentCount: $commentCount,' +
        ' thumbsUpcount: $thumbsUpcount,' +
        '}';
  }

  Comment copyWith({
    String? comment,
    int? commentCount,
    int? thumbsUpcount,
  }) {
    return Comment(
      comment: comment ?? this.comment,
      commentCount: commentCount ?? this.commentCount,
      thumbsUpcount: thumbsUpcount ?? this.thumbsUpcount,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'comment': this.comment,
      'commentCount': this.commentCount,
      'thumbsUpcount': this.thumbsUpcount,
    };
  }

  factory Comment.fromMap(Map<String, dynamic> map) {
    return Comment(
      comment: map['comment'] as String,
      commentCount: map['commentCount'] as int,
      thumbsUpcount: map['thumbsUpcount'] as int,
    );
  }

//</editor-fold>
}

enum PredictionType { Bull, Bear }

enum ContentType {
  News, Comment, ForeignNews
}


extension ContentTypeExtension on ContentType {

  String get name {
    switch (this) {
      case ContentType.News:
        return '국내 뉴스';
      case ContentType.ForeignNews:
        return '해외 뉴스';
      case ContentType.Comment:
        return '코멘트';
      default:
        return '';
    }
  }
}
