import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kt_dart/collection.dart';

class BranchController extends GetxController {
  KtMutableList<BranchModel> _items = KtMutableList.of(
    BranchModel(
        createdAt: DateTime.utc(2022, 2, 23, 14, 25),
        content: '씨에스윈드, 종속회사 ASM Industries 지분 추가 취득 결정',
        header: BranchHeaderModel(
            contentType: ContentType.News,
            predictionType: PredictionType.Bear,
            tags: []),
        expand: false,
        comment: BranchCommentModel(
            comment: '독자 경영권 확보했고, 제무제푶 상 매출 올라 갈것',
            thumbsUpCount: 12,
            commentCount: 6)),
    BranchModel(
        createdAt: DateTime.utc(2022, 2, 23, 14, 23),
        content: '전운에 씨에스윈드, 부각되네.....',
        header: BranchHeaderModel(
            contentType: ContentType.News,
            predictionType: PredictionType.Bear,
            tags: []),
        expand: false,
        comment: null),
    BranchModel(
        createdAt: DateTime.utc(2022, 2, 23, 14, 21),
        content: '러시아 리스크 풍력주 기회',
        header: BranchHeaderModel(
            contentType: ContentType.ForeignNews,
            predictionType: PredictionType.Bull,
            tags: []),
        expand: false,
        comment: null),
    BranchModel(
        createdAt: DateTime.utc(2022, 2, 22, 11, 09),
        content: '평단 5.6 주주입니다. 상방으로 가려면...',
        header: BranchHeaderModel(
            contentType: ContentType.Comment,
            predictionType: PredictionType.Bull,
            tags: ['#주주인증']),
        expand: false,
        comment: BranchCommentModel(
            comment:
            '거래량은 한 번 터져야 된다고 생각합니다.\n몇 달 째 연이은 하락으로 조금씩 매수를 해나가고 있습니다.',
            thumbsUpCount: 12,
            commentCount: 6)),
  );

  KtList<BranchModel> get items {
    return _items;
  }

  KtMap<String, KtList<BranchModel>> get group {
    return items
        .sortedByDescending((p0) => p0.createdAt)
        .groupBy((it) => '${it.createdAt.month}/${it.createdAt.day}');
  }

  @override
  void onInit() {
    super.onInit();
  }

  void expand(int parentIndex, BranchModel feed) {
    var index = items.indexOf(feed);
    _items[index] = feed.copyWith(expand: !feed.expand);
    update();
  }

  void add() {
    _items.add(BranchModel(
        createdAt: DateTime.now(),
        content: '아이템 추가',
        header: BranchHeaderModel(
            contentType: ContentType.Comment,
            predictionType: PredictionType.Bear,
            tags: []),
        expand: false,
        comment: BranchCommentModel(comment: '추가', thumbsUpCount: 12, commentCount: 6)));
    update();
  }
}

class BranchModel {
  final DateTime createdAt; // final DateTime createdAt;
  final String content;
  final BranchHeaderModel header;
  final bool expand;
  final BranchCommentModel? comment;

  String timeString() => DateFormat('HH:mm').format(createdAt);

//<editor-fold desc="Data Methods">

  const BranchModel({
    required this.createdAt,
    required this.content,
    required this.header,
    required this.expand,
    required this.comment,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          (other is BranchModel &&
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
    return 'BranchModel{' +
        ' createdAt: $createdAt,' +
        ' content: $content,' +
        ' header: $header,' +
        ' expand: $expand,' +
        ' comment: $comment,' +
        '}';
  }

  BranchModel copyWith({
    DateTime? createdAt,
    String? content,
    BranchHeaderModel? header,
    bool? expand,
    BranchCommentModel? comment,
  }) {
    return BranchModel(
      createdAt: createdAt ?? this.createdAt,
      content: content ?? this.content,
      header: header ?? this.header,
      expand: expand ?? this.expand,
      comment: comment ?? this.comment,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'createdAt': createdAt,
      'content': content,
      'header': header,
      'expand': expand,
      'comment': comment,
    };
  }

  factory BranchModel.fromMap(Map<String, dynamic> map) {
    return BranchModel(
      createdAt: map['createdAt'] as DateTime,
      content: map['content'] as String,
      header: map['header'] as BranchHeaderModel,
      expand: map['expand'] as bool,
      comment: map['comment'] as BranchCommentModel,
    );
  }

//</editor-fold>
}

class BranchHeaderModel {
  final ContentType contentType;
  final PredictionType predictionType;
  final List<String> tags;

//<editor-fold desc="Data Methods">

  const BranchHeaderModel({
    required this.contentType,
    required this.predictionType,
    required this.tags,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          (other is BranchHeaderModel &&
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
    return 'BranchHeaderModel{' +
        ' contentType: $contentType,' +
        ' predictionType: $predictionType,' +
        ' tags: $tags,' +
        '}';
  }

  BranchHeaderModel copyWith({
    String? title,
    ContentType? contentType,
    PredictionType? predictionType,
    List<String>? tags,
  }) {
    return BranchHeaderModel(
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

  factory BranchHeaderModel.fromMap(Map<String, dynamic> map) {
    return BranchHeaderModel(
      contentType: map['contentType'] as ContentType,
      predictionType: map['predictionType'] as PredictionType,
      tags: map['tags'] as List<String>,
    );
  }

//</editor-fold>
}

class BranchCommentModel {
  final String comment;
  final int commentCount;
  final int thumbsUpCount;

//<editor-fold desc="Data Methods">

  const BranchCommentModel({
    required this.comment,
    required this.commentCount,
    required this.thumbsUpCount,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          (other is BranchCommentModel &&
              runtimeType == other.runtimeType &&
              comment == other.comment &&
              commentCount == other.commentCount &&
              thumbsUpCount == other.thumbsUpCount);

  @override
  int get hashCode =>
      comment.hashCode ^ commentCount.hashCode ^ thumbsUpCount.hashCode;

  @override
  String toString() {
    return 'BranchCommentModel{' +
        ' comment: $comment,' +
        ' commentCount: $commentCount,' +
        ' thumbsUpCount: $thumbsUpCount,' +
        '}';
  }

  BranchCommentModel copyWith({
    String? comment,
    int? commentCount,
    int? thumbsUpCount,
  }) {
    return BranchCommentModel(
      comment: comment ?? this.comment,
      commentCount: commentCount ?? this.commentCount,
      thumbsUpCount: thumbsUpCount ?? this.thumbsUpCount,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'comment': this.comment,
      'commentCount': this.commentCount,
      'thumbsUpCount': this.thumbsUpCount,
    };
  }

  factory BranchCommentModel.fromMap(Map<String, dynamic> map) {
    return BranchCommentModel(
      comment: map['comment'] as String,
      commentCount: map['commentCount'] as int,
      thumbsUpCount: map['thumbsUpCount'] as int,
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
