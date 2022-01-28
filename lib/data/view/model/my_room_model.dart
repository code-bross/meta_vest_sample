
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

  MyRoomModel(
      this.title,
      this.id,
      this.followCount,
      this.followingCount,
      this.selectAliasName,
      this.selectAliasImageUrl,
      this.profileImageUrl,
      this.aliasImageUrls,
      this.interestIndicators,
      this.myRoomAnalyticsModel);
}

extension MyRoomModelExtension on MyRoomModel{
  String followCountString() => '$followCount 명';
  String followingCountString() => '$followingCount 명';
}

class MyRoomAnalyticsModel {
  final Map<String, double> investedInfoMap;

  MyRoomAnalyticsModel(this.investedInfoMap);
}
