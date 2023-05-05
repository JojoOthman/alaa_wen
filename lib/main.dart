import 'package:ala_ween/msgs.dart';
import 'package:ala_ween/presentation/screens/splash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: Locale("ar"),
      translations: Messages(),
      title: 'على وين',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'ReadexPro',
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}

