import 'package:flutter/material.dart';

import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:startup_name_generator/main.dart';

class MainSplashScreen extends StatelessWidget {
  const MainSplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Startup Name Generator',
      home: Scaffold(
        body: EasySplashScreen(
          navigator: MyApp(),
          showLoader: false,
          logo: Image.asset('img/icon.png'),
          backgroundColor: Color(0xFFFF5757),
           logoSize: 170,
           durationInSeconds: 2,
        ),
      ),
    );
  }
}
