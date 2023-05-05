import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import '../resources/color_manager.dart';
import '../widgets/bottom_sheet.dart';
import 'gathering.dart';
import 'map.dart';


class OverViewScreen extends StatefulWidget {
  @override
  _OverViewScreenState createState() => _OverViewScreenState();
}

class _OverViewScreenState extends State<OverViewScreen> {


  TextEditingController code = new TextEditingController();
  int _currentIndex = 0;

  List<String> _images = [
    'assets/images/lack.jpg',
    'assets/images/logo.png',
    'assets/images/img1.jpg',
  ];

  List<String> _images1 = [
    'https://via.placeholder.com/500x250/FF0000/FFFFFF',
    'https://via.placeholder.com/500x250/00FF00/FFFFFF',
    'https://via.placeholder.com/500x250/0000FF/FFFFFF',
    'https://via.placeholder.com/500x250/FFFF00/FFFFFF',
  ];
  Future askLocationPermission() async {
    var status = await Permission.location.status;
    if (status.isGranted == false) {
      await Permission.location.request();
    }
    if (status.isPermanentlyDenied) {
      openAppSettings();
    }
  }

  @override
  void initState() {
    askLocationPermission();
    super.initState();
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
              colors: [ColorManager.primaryTop,ColorManager.primaryBottom],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
          ),
          child: Scaffold(
            resizeToAvoidBottomInset: true,
            backgroundColor: Colors.transparent,
            body: Container(
                height: MediaQuery
                    .of(context)
                    .size
                    .height*1.2,
                width: double.infinity,
                child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0,left:8,top: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap:(){},
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                      child: Icon(Icons.menu,size: 25,color: Colors.white,),
                                    )),
                                InkWell(
                                  onTap:(){
                                    //???
                                  },
                                    child: Icon(Icons.arrow_forward_ios,size: 22,color: Colors.white,)),
                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5),
                                  child: Text(
                                    '3la Ween?'
                                        .tr,
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        color: Color(0xFF2E2F2E),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Stack(
                            children: [
                              CarouselSlider(
                                options: CarouselOptions(
                                  height: 150,
                                  initialPage: _currentIndex,
                                  viewportFraction: 1.0,
                                  enlargeCenterPage: false,
                                  onPageChanged: (index, reason) {
                                    setState(() {
                                      _currentIndex = index;
                                    });
                                  },
                                ),
                                items: _images.map((image) {
                                  return Builder(
                                    builder: (BuildContext context) {
                                      return Container(
                                        width: MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(10.0),
                                        ),
                                        child: Image.asset(
                                          image,
                                          fit: BoxFit.cover,
                                        ),
                                      );
                                    },
                                  );
                                }).toList(),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 50,
                                left: 50,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: _images.map((image) {
                                    int index = _images.indexOf(image);
                                    print(index);
                                    return Container(
                                      width: 8.0,
                                      height: 8.0,
                                      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: _currentIndex == index ? Colors.white : Colors.grey.withOpacity(0.5),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ]

                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 20.0,left: 20,top: 20,bottom: 10),
                                  child: CarouselSlider(
                                    options: CarouselOptions(
                                      height: 120,
                                      initialPage: _currentIndex,
                                      viewportFraction: 1.0,
                                      enlargeCenterPage: false,
                                      onPageChanged: (index, reason) {
                                        setState(() {
                                          _currentIndex = index;

                                        });
                                      },
                                    ),
                                    items: _images1.map((image) {
                                      return Builder(
                                        builder: (BuildContext context) {
                                          return
                                             Container(
                                               width: MediaQuery.of(context).size.width,
                                               child: ClipRRect(
                                                 borderRadius: BorderRadius.circular(10),
                                                 child: Image.network(
                                                   image,
                                                   fit: BoxFit.cover,
                                                 ),
                                               ),
                                             );
                                        },
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding:
                            const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                            child: Container(
                              height: 43.0,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(35),
                                ),
                              child: TextField(
                                cursorColor: ColorManager.darkGrey,
                                textAlignVertical: TextAlignVertical.center,
                                //controller: searchE,
                                onChanged: (t) {
                                },
                                decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10,vertical: 18),
                                  border: InputBorder.none,
                                  hintText: 'Search for .....'.tr,
                                  hintStyle: TextStyle(color:ColorManager.darkGrey,fontSize: 13),
                                  prefixIcon: InkWell(
                                    onTap: () {
                                    },
                                    child: Icon(
                                      Icons.search,
                                      color: ColorManager.darkGrey,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  child: InkWell(
                                    onTap: (){
                                      Get.to(()=> GatheringScreen());
                                    },
                                    child: Container(

                                      height: 100,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [ColorManager.gradiantLeftLight,Color(
                                              0xFF88F6EE),],
                                          begin: Alignment.topRight,
                                          end: Alignment.bottomLeft,
                                        ),
                                        borderRadius: BorderRadius.circular(30)
                                      ),
                                      child: Center(child: Text('Gatherings'.tr,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),)),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 45,),
                                Expanded(
                                  child: InkWell(
                                    onTap: (){
                                    //  Get.to(()=>EntertainScreen());
                                    },
                                    child: Container(
                                      height: 100,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [ColorManager.gradiantLeftLight,Color(
                                              0xFF88F6EE),],
                                          begin: Alignment.topRight,
                                          end: Alignment.bottomLeft,
                                        ),
                                        borderRadius: BorderRadius.circular(30)
                                      ),
                                      child: Center(child: Text('Entertainment'.tr,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),)),
                                    ),
                                  ),
                                ),

                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  child: InkWell(
                                    onTap: (){
                                    //  Get.to(()=>RelaxingScreen());
                                    },
                                    child: Container(
                                      height: 100,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [ColorManager.gradiantLeftLight,Color(
                                              0xFF44EFDC)],
                                          begin: Alignment.topRight,
                                          end: Alignment.bottomLeft,
                                        ),
                                        borderRadius: BorderRadius.circular(30)
                                      ),
                                      child: Center(child: Text('Relaxation and recuperation'.tr,textAlign: TextAlign.center,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),)),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 45,),
                                Expanded(
                                  child: InkWell(
                                    onTap: (){
                                   //   Get.to(()=> AdventureScreen());
                                    },
                                    child: Container(
                                      height: 100,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [ColorManager.gradiantLeftLight,Color(
                                              0xFF88F6EE)],
                                          begin: Alignment.topRight,
                                          end: Alignment.bottomLeft,
                                        ),
                                        borderRadius: BorderRadius.circular(30)
                                      ),
                                      child: Center(child: Text('Adventure & Exploration'.tr,textAlign: TextAlign.center,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),)),
                                    ),
                                  ),
                                ),

                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 260,
                                  height: 30,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        side: BorderSide(color: Colors.white, width: 2),
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                        backgroundColor:Color(0xFFA6ECD6),
                                        elevation: 0
                                    ),
                                    onPressed: () {
                                     Get.to(()=>MapScreen());

                                    },
                                    child: Center(
                                      child: Text(
                                        'Locate on map'.tr,

                                        style: TextStyle(color: Color(0xFF838181),fontSize: 13,fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),


                        ]))

            ),
            bottomNavigationBar: BottomSheetWidget(),
          ),
        ),
      ),

    );
  }
}

