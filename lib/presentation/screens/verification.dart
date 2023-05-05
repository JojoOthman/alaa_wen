import 'dart:async';

import 'package:ala_ween/presentation/screens/over_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../resources/color_manager.dart';
import 'package:otp_text_field/otp_field.dart';


class VerificationScreen extends StatefulWidget  {
  final int durationInSeconds =60;

  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  int _counter = 2;
  late Timer _timer;




  TextEditingController code = new TextEditingController();


  @override
  void initState() {
    super.initState();
    _counter = widget.durationInSeconds;
    _startTimer();
  }
  String get timerText {
    int minutes = _counter ~/ 60;
    int seconds = _counter % 60;
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }
  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_counter > 0) {
          _counter--;
        } else {
          _timer.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.back();
        return false;
      },
      child: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [ColorManager.primaryTop, ColorManager.primaryBottom],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
          ),
          child: Scaffold(
            resizeToAvoidBottomInset: true,
            backgroundColor: Colors.transparent,
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                height: MediaQuery.of(context).size.height * 1,
                width: double.infinity,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 50.0,bottom: 45),
                        child: Text(
                          '3la Ween'.tr,
                          style: TextStyle(
                              color: ColorManager.font,
                              fontSize: 65,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.only(bottom: 60.0,top:20),
                      //   child: Text(
                      //     'Helps you search and reserve best places'.tr,
                      //     maxLines: 2,
                      //     overflow: TextOverflow.ellipsis,
                      //     textAlign: TextAlign.center,
                      //     style: TextStyle(
                      //         color: ColorManager.font,
                      //         fontSize: 20,
                      //         fontWeight: FontWeight.w500),
                      //   ),
                      // ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 40.0),
                        child: Text(
                          'Please enter the verification code in the text message of the entered number'.tr,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: ColorManager.font,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                  Container(
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 25,right: 8,left: 8),
                      child: OTPTextField(
                        length: 4,
                        width: 130,
                        fieldWidth: 20,
                        style: TextStyle(
                            fontSize: 13
                        ),
                        textFieldAlignment: MainAxisAlignment.spaceAround,
                       // fieldStyle: FieldStyle.underline,
                        onCompleted: (pin) {

                        },

                      ),
                    ),
                  ),

                      Padding(
                        padding:
                        const EdgeInsets.symmetric(vertical: 50.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 107,
                              height: 48,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(30)),
                                  backgroundColor: Colors.white,
                                  elevation: 0,
                                ),
                                onPressed: () {
                                  Get.to(() => OverViewScreen());
                                },
                                child: Center(
                                  child: Text(
                                    'Verify'.tr,
                                    style: TextStyle(
                                        color: ColorManager.textButton,
                                        fontSize: 18,fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: Text(
                          'Resend activation code'.tr,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            decoration:TextDecoration.underline,
                              color: ColorManager.font,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                      ),

                Center(
                  child: Text(
                    timerText,
                    style: TextStyle(fontSize: 20,color: ColorManager.font,fontWeight: FontWeight.w600),
                  ),),


                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

