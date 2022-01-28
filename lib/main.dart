import 'package:flutter/material.dart';
import 'package:online5_modul_lesson_4/pages/home_page.dart';
import 'package:online5_modul_lesson_4/pages/intro_page.dart';
import 'home_works/lakatsiya_sanjarakaniki_clon/device_country_page.dart';
import 'home_works/lakatsiya_sanjarakaniki_clon/home_page.dart';
import 'home_works/lakatsiya_sanjarakaniki_clon/login_page.dart';
import 'home_works/lakatsiya_sanjarakaniki_clon/version_page.dart';
void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Intro UI",
      theme: ThemeData(
          scaffoldBackgroundColor:Colors.black,
          appBarTheme: AppBarTheme(backgroundColor: Colors.black),
        backgroundColor: Colors.black
      ),
      debugShowCheckedModeBanner: false,
      home: IntroPage(),
        routes: {
          HomePages.id: (context) => HomePages(),
          VersionPage.id: (context) => VersionPage(),
          DeviceCountryPage.id: (context) => DeviceCountryPage(),
          LoginPage.id: (context) => LoginPage(),
          HomePage.id:(context)=>HomePage(),
          IntroPage.id:(context)=>IntroPage()
      },
    );
  }
}
