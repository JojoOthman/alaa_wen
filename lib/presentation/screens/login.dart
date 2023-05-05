import 'package:ala_ween/presentation/resources/theme_manager.dart';
import 'package:ala_ween/presentation/screens/verification.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../resources/color_manager.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late SharedPreferences prefs;
  bool _isObscure = true;
  bool _isObscure1 = true;
  bool _submitted = false;
  bool _isArabic = true;
  final _formkey = GlobalKey<FormState>();
  List<String> _countryCodes = ['KSA', 'SY'];
  String _selectedCountryCode = 'KSA';

  TextEditingController username = new TextEditingController();
  TextEditingController phone = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController confirmPassword = new TextEditingController();

  Future initPref() async {
    prefs = await SharedPreferences.getInstance();
  }

  setLanguage(String locale) {
    prefs.setString("LANG", locale);
    print("LANG ${locale}");
  }

  getLanguage() {
    return prefs.getString("LANG") ?? "AR";
  }

  @override
  void initState() {
    initPref().whenComplete(() {
      String lang = getLanguage();
      Get.locale = Locale(lang.toLowerCase());
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        showExitDialog(context);
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
            body: Form(
              key: _formkey,
              child: Container(
                height: MediaQuery.of(context).size.height * 1,
                width: double.infinity,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Stack(children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 55.0),
                            child: Text(
                              '3la Ween'.tr,
                              style: TextStyle(
                                  color: ColorManager.font,
                                  fontSize: 65,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(bottom: 40.0, top: 20),
                            child: Text(
                              'Helps you search and reserve best places'.tr,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: ColorManager.font,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: Text(
                              'Enter your details to create an account or login : '.tr,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: ColorManager.font,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 5),
                            child: Directionality(
                              textDirection:TextDirection.ltr,

                              child: TextFormField(
                                style: TextStyle(
                                    color: ColorManager.darkGrey, fontSize: 13),
                                cursorColor: ColorManager.darkGrey,
                                textAlignVertical: TextAlignVertical.center,
                                controller: username,
                                autovalidateMode: _submitted
                                    ? AutovalidateMode.onUserInteraction
                                    : AutovalidateMode.disabled,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'required field'.tr;
                                  }
                                  return null;
                                },
                                textInputAction: TextInputAction.next,
                                decoration: fieldInputDecoration.copyWith(
                                  hintText: "Name".tr
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 5),
                            child: Directionality(
                              textDirection:TextDirection.ltr,
                              child: TextFormField(
                                keyboardType: TextInputType.phone,
                                style: TextStyle(
                                    color: ColorManager.darkGrey,
                                    fontSize: 13,

                                ),
                                cursorColor: ColorManager.darkGrey,
                                textDirection:  TextDirection.ltr,
                                textAlignVertical:
                                    TextAlignVertical.center,
                                controller: phone,
                                autovalidateMode:  AutovalidateMode.onUserInteraction
                                    ,
                                validator: (text) {
                                  if (text?.isNotEmpty ?? false) {
                                    final n = num.tryParse(text!);
                                    if (n == null && text.isNotEmpty) {
                                      return 'Only numbers must be entered'
                                          .tr;
                                    }
                                  }
                                },
                                textInputAction: TextInputAction.next,
                                decoration: fieldInputDecoration.copyWith(
                                  hintText:  "+996 5X XXX XXXX".tr,
                                  prefixIcon:Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton(
                                        iconSize: 25,
                                        value: _selectedCountryCode,
                                        onChanged: (value) {
                                          setState(() {
                                            _selectedCountryCode = value!;
                                          });
                                        },
                                        items: _countryCodes.map((code) {
                                          return DropdownMenuItem(
                                            value: code,
                                            child: Text(code,
                                                style: TextStyle(
                                                    color:
                                                    ColorManager.darkGrey,
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w500
                                                )),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ),

                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 5),
                            child: Directionality(
                              textDirection:TextDirection.ltr,

                              child: TextFormField(
                                scrollPadding: EdgeInsets.only(
                                    bottom: MediaQuery.of(context).size.height *
                                        0.2),
                                style: TextStyle(
                                    color: ColorManager.darkGrey, fontSize: 13),
                                cursorColor: ColorManager.darkGrey,
                                textAlignVertical: TextAlignVertical.center,
                                controller: password,
                                autovalidateMode: _submitted
                                    ? AutovalidateMode.onUserInteraction
                                    : AutovalidateMode.disabled,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'required field'.tr;
                                  }
                                  return null;
                                },
                                textInputAction: TextInputAction.next,
                                obscureText: _isObscure,
                                decoration: fieldInputDecoration.copyWith(
                                  hintText: "Password".tr,
                                  prefixIcon: IconButton(
                                      icon: Icon(
                                        _isObscure
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                        color: ColorManager.darkGrey,
                                        size: 20,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _isObscure = !_isObscure;
                                        });
                                      }),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 5),
                            child: Directionality(
                              textDirection:TextDirection.ltr,

                              child: TextFormField(
                                scrollPadding: EdgeInsets.only(
                                    bottom: MediaQuery.of(context).size.height *
                                        0.2),
                                style: TextStyle(
                                    color: ColorManager.darkGrey, fontSize: 13),
                                cursorColor: ColorManager.darkGrey,
                                textAlignVertical: TextAlignVertical.center,
                                controller: confirmPassword,
                                autovalidateMode: _submitted
                                    ? AutovalidateMode.onUserInteraction
                                    : AutovalidateMode.disabled,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'required field'.tr;
                                  }
                                  if (confirmPassword.text != password.text) {
                                    return 'Passwords does not match'.tr;
                                  }
                                  return null;
                                },
                                textInputAction: TextInputAction.next,
                                obscureText: _isObscure1,
                                decoration: fieldInputDecoration.copyWith(
                                  hintText: "Confirm password".tr,
                                  prefixIcon: IconButton(
                                      icon: Icon(
                                        _isObscure1
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                        color: ColorManager.darkGrey,
                                        size: 20,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _isObscure1 = !_isObscure1;
                                        });
                                      }),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(vertical: 20.0),
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
                                      Get.to(() => VerificationScreen());
                                    },
                                    child: Center(
                                      child: Text(
                                        'Submit'.tr,
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
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: Text(
                              'We will send you a SMS on the entered number containing a code to continue'
                                  .tr,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: ColorManager.font,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                        top: 15,
                        left: 10,
                        child: InkWell(
                            onTap: () {
                              _isArabic = !_isArabic;
                              if (_isArabic == true) {
                                Get.updateLocale(Locale("ar"));
                                setLanguage("ar");
                              } else {
                                Get.updateLocale(Locale("en"));
                                setLanguage("en");
                              }
                            },
                            child: _isArabic
                                ? Text(
                                    'English',
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.white,fontWeight: FontWeight.w500),
                                  )
                                : Text(
                                    'عربي',
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.white,fontWeight: FontWeight.w500),
                                  ))),
                  ]),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  showExitDialog(context) {
    showDialog(
      context: context,
      builder: (_) => new AlertDialog(
        title: Text(
          'Are You Sure To Exit?'.tr,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 14.0),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                ),
                onPressed: () {
                  SystemNavigator.pop();
                },
                child: Text(
                  'Yes'.tr,
                  style: TextStyle(
                    color: ColorManager.textButton,
                  ),
                ),
              ),
              SizedBox(
                width: 20.0,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorManager.textButton,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'No'.tr,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
