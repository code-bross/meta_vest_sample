import 'dart:math';
import 'package:easy_localization/easy_localization.dart';
import 'package:faker/faker.dart' as LegacyFaker;
import 'package:faker_dart/faker_dart.dart';
import 'package:jiffy/jiffy.dart';
import 'package:kt_dart/kt.dart';
import 'package:meta_vest_sample/data/view/model/feed_model.dart';
import 'package:meta_vest_sample/data/view/model/my_room_model.dart';
import 'package:meta_vest_sample/data/view/model/ranking_model.dart';
import 'package:faker_dart/src/utils/locale_utils.dart';

class DummyGenerate<T> {
  final _fakeType = _FakeType._instnace;

  dynamic get generate {
    switch (T) {
      case FeedModel:
        return _getFeedModel();
      case List<FeedModel>:
        return _getFeedModelList();
      case RankingModel:
        return _getRankingModel(Random.secure().nextInt(20));
      case List<RankingModel>:
        return _getRankingModelList();
      case MyRoomModel:
        return _getMyRoomModel();
    }
  }

/*
  final String name;
  final DateTime time;
  final List<String> tags;
  final String content;
  final String description;
  final String imageUrl;
  @see also {@link ../data/view/model/feed_model.dart}
  [link] [../data/view/model/feed_model.dart]
  <a href="file:../data/view/model/feed_model.dart">Easy words</a>
 */
  FeedModel _getFeedModel() {
    return FeedModel(
      name: _fakeType.name(),
      time: _fakeType.time(),
      tags: [
        _fakeType.companyName(),
        _fakeType.companyName(),
        _fakeType.companyName()
      ],
      content: _fakeType.getContent(),
      transaction: _fakeType.transaction(),
      imageUrl: _fakeType.getMimojiUrl(),
    );
  }

  List<FeedModel> _getFeedModelList() =>
      Iterable.generate(100).map((e) => _getFeedModel()).toList();

  /*
    final int rank;
    final double earningRate;
    final double sharpeRate;
    final String imageUrl;
   */
  RankingModel _getRankingModel(int rank) {
    return RankingModel(
        rank: rank,
        earningRate: _fakeType.rate(),
        sharpeRate: _fakeType.rate(),
        imageUrl: _fakeType.getMimojiUrl(),
        investedInfoMap: _getMyInvested()
    );
  }

  List<RankingModel> _getRankingModelList() =>
      Iterable.generate(100).map((i) => _getRankingModel(i + 1)).toList();

  /*
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
   */

  MyRoomModel _getMyRoomModel() => MyRoomModel(
      title: _fakeType.name(),
      id: _fakeType.name(),
      followCount: _fakeType.number(),
      followingCount: _fakeType.number(),
      selectAliasName: _fakeType.name(),
      selectAliasImageUrl: _fakeType.getBadgeImageUrl(),
      profileImageUrl: _fakeType.getMimojiUrl(),
      aliasImageUrls: Iterable.generate(10)
          .map((e) => _fakeType.getBadgeImageUrl())
          .toList(),
      interestIndicators:
          Iterable.generate(10).map((e) => _fakeType.companyName()).toList(),
      myRoomAnalyticsModel:
          MyRoomAnalyticsModel(investedInfoMap: _getMyInvested()));

  List<String> _getCompanies() =>
      Iterable.generate(10).map((e) => _fakeType.companyName()).toList();

  Map<String, double> _getMyInvested() => Map.fromIterable(_getCompanies(),
      key: (key) => key, value: (_) => _fakeType.number().toDouble());
}

class _FakeType {
  static final _FakeType _instnace = _FakeType._internal();
  factory _FakeType() {
    return _instnace;
  }

  final _faker = Faker.instance;
  final _legacyFaker = LegacyFaker.Faker();

  _FakeType._internal() {
    Faker.instance.setLocale(FakerLocaleType.ko);
    Jiffy.locale('ko');
  }

  String getMimojiUrl() {
    List<String> urls = [
      'https://pbs.twimg.com/media/EGL70oUVAAAwhzz.png',
      'https://mblogthumb-phinf.pstatic.net/MjAxOTEwMjlfMjk3/MDAxNTcyMjk4MDI5ODQ3.SYOT8PXEfkiSpkcNqRvUZJWae20zMpG0u5I4jg2a9egg.R0s2eNoQhvOsjGTtEN5eheddAkNK5itN2XGPuA8QKhog.PNG.moonkla1/1572212044476.png?type=w2',
      'https://mblogthumb-phinf.pstatic.net/MjAxOTEwMjlfMjU0/MDAxNTcyMjk4MDI5MjQ0.TxvsZDsiwMA-W7XV4vtwrRMF4WLncy9rpnC-FzGqyAEg.o5VftfJrmJy5UCGBjcOe2C9RTn02mlvZlgQQtj9X0YIg.PNG.moonkla1/1572212046477.png?type=w2',
      'https://2.gall-img.com/hygall/files/attach/images/82/579/741/231/e057f84e1e2f155c8f3d59ca8ab5e4bd.png',
      'https://i.imgur.com/zOaV3fA.png',
      'https://2.gall-img.com/hygall/files/attach/images/82/489/259/237/1926aa0bdf9b50b95cf9373cc6bc6b37.png',
      'https://2.gall-img.com/hygall/files/attach/images/82/797/153/235/3a59e6663feb4e80b217f1ddb74c89bb.png',
      'https://2.gall-img.com/hygall/files/attach/images/82/797/153/235/d59f4e206711e5692469397792ec6c20.png',
      'https://pbs.twimg.com/media/Ex5iMR_UcAEvbpg.png',
      'https://pbs.twimg.com/media/EGqRS4wUwAE3Or9.png',
      'https://pbs.twimg.com/media/EGL70oUVAAAwhzz.png',
      'https://pbs.twimg.com/media/EG6nsOzUUAAIAHR.png',
      'https://pbs.twimg.com/media/EYBX5Y4WkAYAz9F.png:small'
    ];

    var random = _legacyFaker.randomGenerator.numbers(urls.length, 10);
    return urls[random.first];
  }

  String getBadgeImageUrl() {
    List<String> urls = [
      'https://icons.iconarchive.com/icons/seanau/fresh-web/512/Badge-icon.png',
      'https://i.pinimg.com/originals/fa/ae/35/faae351bb8979a4b76d90b22c4623e8d.png',
      'https://icon-library.com/images/police-badge-icon-png/police-badge-icon-png-23.jpg',
      'https://download.logo.wine/logo/Cash_App/Cash_App-Logo.wine.png',
      'https://icons.veryicon.com/png/o/application/a-set-of-qq-icons-by-offering-flowers-to/jewellery-4.png',
      'https://www.pinclipart.com/picdir/big/580-5800149_transparent-diamonds-clipart-transparent-background-jewellery-icon-png.png',
      'https://icon-library.com/images/jewelry-icon-png/jewelry-icon-png-1.jpg'
    ];

    var random = _legacyFaker.randomGenerator.numbers(urls.length, 10);
    return urls[random.first];
  }

  String hashTag() => '#${_faker.company.companyName()}';

  String getContent() => _faker.lorem.paragraph();

  String getTime() {
    var dateTime = _legacyFaker.date.dateTime(
        minYear: DateTime.now().year - 1, maxYear: DateTime.now().year);
    return Jiffy(
            DateFormat('yyyy-MM-dd HH:mm').format(dateTime), 'yyyy-MM-dd HH:mm')
        .fromNow();
  }

  String name() => _faker.name.firstName();

  String transaction() {
    var amount = '${_legacyFaker.randomGenerator.numbers(1000, 100).first}주';
    var randomDate = _legacyFaker.date.dateTime(
        minYear: DateTime.now().year - 1, maxYear: DateTime.now().year);
    var dateTime = '(${DateFormat('yyyy/MM/dd').format(randomDate)} 인증)';
    return '@${companyName()} $amount $dateTime';
  }

  DateTime time() => _legacyFaker.date
      .dateTime(minYear: DateTime.now().year - 1, maxYear: DateTime.now().year);
  String companyName() => _faker.company.let((e) => '${name()} ${e.companySuffix()}');
  double rate() => _legacyFaker.randomGenerator.decimal(min: -10, scale: 100);
  int number() => Random.secure().nextInt(1000);
}
