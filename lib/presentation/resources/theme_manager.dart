import 'package:ala_ween/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


  InputDecoration fieldInputDecoration =InputDecoration(

    contentPadding: EdgeInsets.all(10),
    fillColor: Colors.white,
    filled: true,
    hintText: "Name".tr,
    hintStyle: TextStyle(
        color: ColorManager.lightGrey,
        fontSize: 13,
      fontWeight: FontWeight.w500
        ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide.none,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide.none,
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: Colors.red),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide.none,
    ),
    prefixIcon: Icon(
      Icons.person_outline,
      color: ColorManager.darkGrey,
    ),
  );
