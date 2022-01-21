import 'package:easy_localization/easy_localization.dart';

//import 'package:easy_localization_loader/easy_localization_loader.dart'; // import custom loaders
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotto_checker/pages/root/root_page.dart';

import 'core/lang/locale_keys.g.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(EasyLocalization(
    child: MyApp(),
    supportedLocales: const [Locale('en')],
    path: 'resources/langs',
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const RootPage(),
    );
  }
}

