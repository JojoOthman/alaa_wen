import 'dart:async';

import 'package:ala_ween/presentation/widgets/bottom_bar_controller.dart';
import 'package:ala_ween/presentation/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:ala_ween/presentation/resources/color_manager.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    Get.put(BottomBarController());
    Timer(
          const Duration(seconds: 5),
              () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) =>  LoginScreen())));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
          decoration:  BoxDecoration(
            gradient: LinearGradient(
              colors: [ColorManager.primaryTop, ColorManager.primaryBottom],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
          ),
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.transparent,
            body: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Image.asset(
                        'assets/images/logo.png',
                        height: 200,
                        width: 200,
                      ),
                    ),
                  ],
                ),
                Positioned(
                  bottom: 50,
                  left: 25,
                  right: 25,
                  child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 150,
                          child: LinearProgressIndicator(
                            color: ColorManager.primaryBottom,
                            backgroundColor: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Powered by Golden Soft',
                      style: TextStyle(color: Colors.white),
                    ),
                  ]),
                ),
              ],
            ),
          ),
        ));
  }
}
