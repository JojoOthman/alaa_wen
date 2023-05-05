import 'package:ala_ween/presentation/screens/service_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../resources/color_manager.dart';
import '../widgets/bottom_sheet.dart';

class Details2Screen extends StatefulWidget {
  const Details2Screen({Key? key}) : super(key: key);

  @override
  State<Details2Screen> createState() => _Details2ScreenState();
}

class _Details2ScreenState extends State<Details2Screen> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xFFF4F2F2),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0,left:8,top: 10,bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                          onTap:(){},
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Icon(Icons.menu,size: 25,color: Colors.grey[500],),
                          )),
                      InkWell(
                          onTap:(){
                            Get.back();
                          },
                          child: Icon(Icons.arrow_forward_ios,size: 22,color: Colors.grey[500],)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 130,
                    child: Image.asset('assets/images/logo.png',fit: BoxFit.cover,),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 10),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    // height: 550,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 10.0,right: 5,left: 5),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 1,
                                          ),),
                                        child: Icon(Icons.circle,color: Color(0xFF27D685),size: 15,)),
                                    Text(
                                      'Service : '.tr,
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: ColorManager.darkGrey
                                      ),
                                    ),
                                    Text(
                                      'XXXX',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: ColorManager.darkGrey
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 10.0,
                                    right: 8,
                                    left: 8),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Container(
                                          width: 40,
                                          decoration: BoxDecoration(
                                            color: Colors.grey[100],
                                            borderRadius:
                                            BorderRadius.circular(
                                                20),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets
                                                .symmetric(
                                                horizontal: 4.0),
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.star,
                                                  color: ColorManager
                                                      .stars,
                                                  size: 12,
                                                ),
                                                Text(
                                                  '3.5',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight:
                                                    FontWeight.w400,
                                                    color: ColorManager
                                                        .darkGrey,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10,),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.grey[100],
                                        borderRadius:
                                        BorderRadius.circular(
                                            20),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets
                                            .symmetric(
                                            horizontal: 2.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'View location '.tr,
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight:
                                                FontWeight.w400,
                                                color: Color(0xFF27D685),
                                              ),
                                            ),
                                            Icon(
                                              Icons
                                                  .location_on_sharp,
                                              color: ColorManager
                                                  .darkGrey,
                                              size: 12,
                                            ),
                                            Text(
                                              '3.54' + 'km'.tr,
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight:
                                                FontWeight.w400,
                                                color: ColorManager
                                                    .darkGrey,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(padding: EdgeInsets.symmetric(horizontal: 8,vertical: 10),
                          child: Column(children: [
                            Container(
                              width: double.infinity,
                              child: Text('Service Description:'.tr,
                                textAlign: TextAlign.start,
                                style: TextStyle(color: Color(0xFF27D685),fontWeight: FontWeight.bold),),
                            ),
                            Container(
                              width: double.infinity,
                              child: Text('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx',
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 3,
                                style: TextStyle(color: ColorManager.darkGrey),),
                            ),
                          ],),
                        ),


                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8,vertical: 15),
                          child: Row(
                            children: [
                              Text('Price : '.tr,
                                textAlign: TextAlign.start,
                                style: TextStyle(color: Color(0xFF27D685),fontWeight: FontWeight.bold),),
                              Text('50'.tr,
                                textAlign: TextAlign.start,
                                style: TextStyle(color: ColorManager.lightGrey),),
                            ],
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Container(
                            width: double.infinity,
                            child: Text('Working Days:'.tr,
                              textAlign: TextAlign.start,
                              style: TextStyle(color: Color(0xFF27D685),fontWeight: FontWeight.bold),),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Container(
                            width: double.infinity,
                            child: Text('أحد , اثنين , ثلاثاء , أربعاء'.tr,
                              textAlign: TextAlign.start,

                              style: TextStyle(color: ColorManager.darkGrey),),
                          ),
                        ),
                        SizedBox(height: 25,),

                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Container(
                            width: double.infinity,
                            child: Text('Terms and Conditions of Service:'.tr,
                              textAlign: TextAlign.start,
                              style: TextStyle(color: Color(0xFF27D685),fontWeight: FontWeight.bold),),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Container(
                            width: double.infinity,
                            child: Text('By booking this service, you confirm and agree to all terms and conditions'.tr,
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                              style: TextStyle(color: ColorManager.darkGrey),),
                          ),
                        ),


                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),

                          child: Column(
                            children: [
                              Container(
                                width: double.infinity,
                                child: Row(
                                  children: [
                                    Text('Limit per booking : '.tr +'  ',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(color: ColorManager.darkFont,fontSize: 12),),
                                    Text('30'.tr,
                                      textAlign: TextAlign.start,
                                      style: TextStyle(color: ColorManager.lightGrey,fontSize: 12),),
                                  ],
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                child: Row(
                                  children: [
                                    Text('Price : '.tr +'  ',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(color: ColorManager.darkFont,fontSize: 12),),
                                    Text('12 _ 40 '.tr,
                                      textAlign: TextAlign.start,
                                      style: TextStyle(color: ColorManager.lightGrey,fontSize: 12),),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    flex:1,
                                    child: Text('Booking and cancellation: '.tr +'  ',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(color: ColorManager.darkFont,fontSize: 12),),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Text('Booking is non-cancellable and non-refundable'.tr,
                                      textAlign: TextAlign.start,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(color: ColorManager.lightGrey,fontSize: 12),),
                                  ),
                                ],
                              ),

                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),

                          child: Column(
                            children: [
                              Container(
                                width: double.infinity,
                                child: Text('xxxxxxxxxxxxx'.tr,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(color: Color(0xFF27D685),fontWeight: FontWeight.bold),),
                              ),
                              Container(
                                width: double.infinity,
                                child: Text('xxxxxxxxxxxxx'.tr,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(color: Color(0xFF27D685),fontWeight: FontWeight.bold),),
                              ),
                              Container(
                                width: double.infinity,
                                child: Text('xxxxxxxxxxxxx'.tr,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(color: Color(0xFF27D685),fontWeight: FontWeight.bold),),
                              ),
                              Container(
                                width: double.infinity,
                                child: Text('xxxxxxxxxxxxx'.tr,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(color: Color(0xFF27D685),fontWeight: FontWeight.bold),),
                              ),

                            ],
                          ),
                        ),
                        SizedBox(height: 50,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10.0),
                              child: InkWell(
                                onTap: (){
                                  Get.to(()=> ServiceProvider());
                                },
                                child: Container(
                                    width: 130,
                                    height: 47,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.topRight,
                                        end: Alignment.bottomLeft,
                                        colors: [
                                          ColorManager.gradiantLeftLight,

                                          ColorManager.gradiantRightLight,
                                        ],
                                      ),
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                    ),
                                    child: Text(
                                      'Select'.tr,
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: ColorManager.darkGrey,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ),
                            ),

                          ],
                        ),

                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          bottomNavigationBar: BottomSheetWidget(),
        )
    );
  }
}
