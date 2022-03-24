import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';
import 'package:kt_dart/kt.dart';
import 'package:meta_vest_sample/pages/dev.setting/branch/branch_controller.dart';

class BranchSearchController extends GetxController {
  KtList<BranchLatestSearchModel> items = KtList.of(
    BranchLatestSearchModel(
        title: '셀트리온',
        timeStamp: DateTime.now().subtract(Duration(minutes: 3)),
        tag: '#코스피',
        newCount: 10,
        predictionType: PredictionType.Bear),
    BranchLatestSearchModel(
        title: '씨에스 윈드',
        timeStamp: DateTime.now().subtract(Duration(minutes: 5)),
        tag: '#코스피',
        newCount: 23,
        predictionType: PredictionType.Bull),
    BranchLatestSearchModel(
        title: '신한금융지주',
        timeStamp: DateTime.now().subtract(Duration(minutes: 8)),
        tag: '#코스피',
        newCount: 7,
        predictionType: PredictionType.Bull),
  );

  @override
  void onInit() {
    super.onInit();
  }
}

class BranchLatestSearchModel {
  final String title;
  final DateTime timeStamp;
  final String tag;
  final int newCount;
  final PredictionType predictionType;

//<editor-fold desc="Data Methods">

  const BranchLatestSearchModel({
    required this.title,
    required this.timeStamp,
    required this.tag,
    required this.newCount,
    required this.predictionType,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BranchLatestSearchModel &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          timeStamp == other.timeStamp &&
          tag == other.tag &&
          newCount == other.newCount &&
          predictionType == other.predictionType);

  @override
  int get hashCode =>
      title.hashCode ^
      timeStamp.hashCode ^
      tag.hashCode ^
      newCount.hashCode ^
      predictionType.hashCode;

  @override
  String toString() {
    return 'BranchLatestSearchModel{' +
        ' title: $title,' +
        ' timeStamp: $timeStamp,' +
        ' tag: $tag,' +
        ' newCount: $newCount,' +
        ' predictionType: $predictionType,' +
        '}';
  }

  BranchLatestSearchModel copyWith({
    String? title,
    DateTime? timeStamp,
    String? tag,
    int? newCount,
    PredictionType? predictionType,
  }) {
    return BranchLatestSearchModel(
      title: title ?? this.title,
      timeStamp: timeStamp ?? this.timeStamp,
      tag: tag ?? this.tag,
      newCount: newCount ?? this.newCount,
      predictionType: predictionType ?? this.predictionType,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': this.title,
      'timeStamp': this.timeStamp,
      'tag': this.tag,
      'newCount': this.newCount,
      'predictionType': this.predictionType,
    };
  }

  factory BranchLatestSearchModel.fromMap(Map<String, dynamic> map) {
    return BranchLatestSearchModel(
      title: map['title'] as String,
      timeStamp: map['timeStamp'] as DateTime,
      tag: map['tag'] as String,
      newCount: map['newCount'] as int,
      predictionType: map['predictionType'] as PredictionType,
    );
  }

  String timeString() => Jiffy(
      DateFormat('yyyy-MM-dd HH:mm').format(timeStamp), 'yyyy-MM-dd HH:mm')
      .fromNow();

//</editor-fold>
}
