
class MyRoomModel {
  final String title;
  final String id;
  final int followCount;
  final int followingCount;
  final String selectAliasName;
  final String selectAliasImageUrl;
  final String profileImageUrl;
  final List<String> aliasImageUrls;
  final List<String> interestIndicators;
  final MyRoomAnalyticsModel myRoomAnalyticsModel;

//<editor-fold desc="Data Methods">

  const MyRoomModel({
    required this.title,
    required this.id,
    required this.followCount,
    required this.followingCount,
    required this.selectAliasName,
    required this.selectAliasImageUrl,
    required this.profileImageUrl,
    required this.aliasImageUrls,
    required this.interestIndicators,
    required this.myRoomAnalyticsModel,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MyRoomModel &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          id == other.id &&
          followCount == other.followCount &&
          followingCount == other.followingCount &&
          selectAliasName == other.selectAliasName &&
          selectAliasImageUrl == other.selectAliasImageUrl &&
          profileImageUrl == other.profileImageUrl &&
          aliasImageUrls == other.aliasImageUrls &&
          interestIndicators == other.interestIndicators &&
          myRoomAnalyticsModel == other.myRoomAnalyticsModel);

  @override
  int get hashCode =>
      title.hashCode ^
      id.hashCode ^
      followCount.hashCode ^
      followingCount.hashCode ^
      selectAliasName.hashCode ^
      selectAliasImageUrl.hashCode ^
      profileImageUrl.hashCode ^
      aliasImageUrls.hashCode ^
      interestIndicators.hashCode ^
      myRoomAnalyticsModel.hashCode;

  @override
  String toString() {
    return 'MyRoomModel{' +
        ' title: $title,' +
        ' id: $id,' +
        ' followCount: $followCount,' +
        ' followingCount: $followingCount,' +
        ' selectAliasName: $selectAliasName,' +
        ' selectAliasImageUrl: $selectAliasImageUrl,' +
        ' profileImageUrl: $profileImageUrl,' +
        ' aliasImageUrls: $aliasImageUrls,' +
        ' interestIndicators: $interestIndicators,' +
        ' myRoomAnalyticsModel: $myRoomAnalyticsModel,' +
        '}';
  }

  MyRoomModel copyWith({
    String? title,
    String? id,
    int? followCount,
    int? followingCount,
    String? selectAliasName,
    String? selectAliasImageUrl,
    String? profileImageUrl,
    List<String>? aliasImageUrls,
    List<String>? interestIndicators,
    MyRoomAnalyticsModel? myRoomAnalyticsModel,
  }) {
    return MyRoomModel(
      title: title ?? this.title,
      id: id ?? this.id,
      followCount: followCount ?? this.followCount,
      followingCount: followingCount ?? this.followingCount,
      selectAliasName: selectAliasName ?? this.selectAliasName,
      selectAliasImageUrl: selectAliasImageUrl ?? this.selectAliasImageUrl,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
      aliasImageUrls: aliasImageUrls ?? this.aliasImageUrls,
      interestIndicators: interestIndicators ?? this.interestIndicators,
      myRoomAnalyticsModel: myRoomAnalyticsModel ?? this.myRoomAnalyticsModel,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': this.title,
      'id': this.id,
      'followCount': this.followCount,
      'followingCount': this.followingCount,
      'selectAliasName': this.selectAliasName,
      'selectAliasImageUrl': this.selectAliasImageUrl,
      'profileImageUrl': this.profileImageUrl,
      'aliasImageUrls': this.aliasImageUrls,
      'interestIndicators': this.interestIndicators,
      'myRoomAnalyticsModel': this.myRoomAnalyticsModel,
    };
  }

  factory MyRoomModel.fromMap(Map<String, dynamic> map) {
    return MyRoomModel(
      title: map['title'] as String,
      id: map['id'] as String,
      followCount: map['followCount'] as int,
      followingCount: map['followingCount'] as int,
      selectAliasName: map['selectAliasName'] as String,
      selectAliasImageUrl: map['selectAliasImageUrl'] as String,
      profileImageUrl: map['profileImageUrl'] as String,
      aliasImageUrls: map['aliasImageUrls'] as List<String>,
      interestIndicators: map['interestIndicators'] as List<String>,
      myRoomAnalyticsModel: map['myRoomAnalyticsModel'] as MyRoomAnalyticsModel,
    );
  }

//</editor-fold>
}

extension MyRoomModelExtension on MyRoomModel{
  String followCountString() => '$followCount 명';
  String followingCountString() => '$followingCount 명';
}

class MyRoomAnalyticsModel {
  final Map<String, double> investedInfoMap;

//<editor-fold desc="Data Methods">

  const MyRoomAnalyticsModel({
    required this.investedInfoMap,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MyRoomAnalyticsModel &&
          runtimeType == other.runtimeType &&
          investedInfoMap == other.investedInfoMap);

  @override
  int get hashCode => investedInfoMap.hashCode;

  @override
  String toString() {
    return 'MyRoomAnalyticsModel{' +
        ' investedInfoMap: $investedInfoMap,' +
        '}';
  }

  MyRoomAnalyticsModel copyWith({
    Map<String, double>? investedInfoMap,
  }) {
    return MyRoomAnalyticsModel(
      investedInfoMap: investedInfoMap ?? this.investedInfoMap,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'investedInfoMap': this.investedInfoMap,
    };
  }

  factory MyRoomAnalyticsModel.fromMap(Map<String, dynamic> map) {
    return MyRoomAnalyticsModel(
      investedInfoMap: map['investedInfoMap'] as Map<String, double>,
    );
  }

//</editor-fold>
}
