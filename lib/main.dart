import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_vest_sample/pages/home/home_page.dart';
import 'package:meta_vest_sample/routes/app_pages.dart';
import 'core/lang/locale_keys.g.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(EasyLocalization(
    child: const MyApp(),
    supportedLocales: const [Locale('en')],
    path: 'resources/langs',
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: Routes.Home,
        getPages: AppPages.pages,
        debugShowCheckedModeBanner: false);
  }
}
