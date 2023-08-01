import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tutorial/view/home_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  // Widget build(BuildContext context) {
  //   SystemChrome.setSystemUIOverlayStyle(
  //     const SystemUiOverlayStyle(
  //       statusBarColor: Colors.transparent,
  //       systemNavigationBarColor: Colors.transparent,
  //     ),
  //   );
  //   SystemChrome.setEnabledSystemUIMode(
  //     SystemUiMode.edgeToEdge,
  //   );
  //   return MaterialApp(
  //     debugShowCheckedModeBanner: false,
  //     title: 'ふらったーきのうかくにんあぷり',
  //     themeMode: ThemeMode.system,
  //     theme: ThemeData(
  //       useMaterial3: true,
  //       colorSchemeSeed: Colors.white,
  //       fontFamily: "MPLUSRounded",
  //       splashColor: Colors.transparent,
  //     ),
  //     // highlightColor: Colors.transparent),
  //     home: const HomePageView(),
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(builder: ((lightDynamic, darkDynamic) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ふらったーきのうかくにんあぷり',
        themeMode: ThemeMode.system, // 自動でテーマ切り替え
        theme: ThemeData(
          // ライトモード用
          useMaterial3: true,
          colorSchemeSeed: lightDynamic?.harmonized().primary ?? Colors.orange,
        ),
        darkTheme: ThemeData(
          // ダークモード用
          useMaterial3: true,
          colorSchemeSeed: darkDynamic?.harmonized().primary ?? Colors.orange,
          brightness: Brightness.dark,
        ),
        home: const HomePage(),
      );
    }));
  }
}
