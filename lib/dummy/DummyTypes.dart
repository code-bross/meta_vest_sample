import 'dart:math';
import 'package:easy_localization/easy_localization.dart';
import 'package:faker/faker.dart' as LegacyFaker;
import 'package:faker_dart/faker_dart.dart';
import 'package:jiffy/jiffy.dart';

class DummyType {
  static final DummyType _instnace = DummyType._internal();

  factory DummyType() {
    return _instnace;
  }

  final _faker = Faker.instance;
  final _legacyFaker = LegacyFaker.Faker();

  DummyType._internal() {
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
      'https://pbs.twimg.com/media/E1o8XWvVUAAWaNY.png:small',
      'https://pbs.twimg.com/media/EYBX5Y4WkAYAz9F.png:small'
    ];

    var random = _legacyFaker.randomGenerator.numbers(urls.length, 10);
    return urls[random.first];
  }

  String hashTag() {
    return '#${_faker.company.companyName()}';
  }

  String getContent() {
    return _faker.lorem.paragraph();
  }

  String getTime() {
    var dateTime = _legacyFaker.date.dateTime(
        minYear: DateTime.now().year - 1, maxYear: DateTime.now().year);
    return Jiffy(
            DateFormat('yyyy-MM-dd HH:mm').format(dateTime), 'yyyy-MM-dd HH:mm')
        .fromNow();
  }

  String name() {
    return _faker.name.firstName();
  }

  String transaction() {
    var companyName = _faker.company.companyName();
    var amount = '${_legacyFaker.randomGenerator.numbers(1000, 100).first}주';
    var randomDate = _legacyFaker.date.dateTime(
        minYear: DateTime.now().year - 1, maxYear: DateTime.now().year);
    var dateTime =  '(${DateFormat('yyyy/MM/dd').format(randomDate)} 인증)';
    return '@$companyName $amount $dateTime';
  }
}
