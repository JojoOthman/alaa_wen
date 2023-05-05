import 'package:ala_ween/presentation/widgets/bottom_bar_controller.dart';
import 'package:ala_ween/presentation/screens/over_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomSheetWidget extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomBarController>(
        builder: (controller) => Container(
              child: CupertinoTabBar(
                  backgroundColor: Colors.white,
                  activeColor: Colors.blue,
                  height: 60,
                  iconSize: 30,
                  items: [
                    BottomNavigationBarItem(
                      icon: Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.grey)),
                          child: Center(
                              child: Text(
                            'A',
                            style: TextStyle(
                                color: controller.selectedTab ==0 ? Colors.blue: Colors.grey,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          )),
                        ),
                      ),
                      label: 'Main'.tr,
                    ),
                    BottomNavigationBarItem(
                      icon: Padding(
                        padding: const EdgeInsets.only(
                          top: 5.0,
                        ),
                        child: Icon(Icons.bookmarks_outlined,color: controller.selectedTab ==1 ? Colors.blue:Colors.grey,),
                      ),
                      label: 'My reserves'.tr,
                    ),
                    BottomNavigationBarItem(
                      icon: Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Icon(Icons.percent,color: controller.selectedTab ==2 ? Colors.blue:Colors.grey,),
                      ),
                      label: 'Offers'.tr,
                    ),
                    BottomNavigationBarItem(
                      icon: Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Icon(Icons.person_outline,color: controller.selectedTab ==3 ? Colors.blue:Colors.grey,),
                      ),
                      label: 'Profile'.tr,
                    ),
                  ],
                  currentIndex: controller.selectedTab,

                  onTap: (index) {
                    controller.updateSelectedTab(index);
                     if (index == 0) {
                       Navigator.of(context).pushReplacement(
                           MaterialPageRoute(builder: (_) => OverViewScreen()));
                       //      } else if (index == 1) {
                       // Navigator.of(context).push(
                       // MaterialPageRoute(builder: (_) => SecondScreen()),
                       // );      } else if (index == 2) {
                       // Navigator.of(context).push(MaterialPageRoute(builder: (_) => ThirdScreen()),
                       // );}
                       // else if (index == 3) {
                       //   Navigator.of(context).push(
                       // MaterialPageRoute(builder: (_) => Fourth()),
                     }  }),
            ));
  }
}
