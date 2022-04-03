import 'package:bit_finance/injection.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

import 'application/constants/routes.dart';
import 'application/constants/styles.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Expense Tracker',
      theme: lightTheme,
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: NoGlowScroll(),
          child: child ?? Container(),
        );
      },
      initialRoute: BitFinanceRoutes.home,
      getPages: BitFinanceRoutes.pages(),
    );
  }
}

class NoGlowScroll extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
