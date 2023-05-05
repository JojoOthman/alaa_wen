import 'package:ala_ween/presentation/resources/color_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/bottom_sheet.dart';
import 'details.dart';

class GatheringScreen extends StatefulWidget {
  @override
  _GatheringScreenState createState() => _GatheringScreenState();
}

class _GatheringScreenState extends State<GatheringScreen>
    with SingleTickerProviderStateMixin {
  GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  bool showLoader = false;
  int amount = 0;
  int selectedTab = 0;
  TabController? _tabController;

  ThemeData t = new ThemeData();

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    _tabController!.addListener(() {
      if (_tabController!.indexIsChanging) {
        selectedTab = _tabController?.index ?? 0;
        if(mounted) {
          setState(() {});
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _globalKey,
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            TabBarView(controller: _tabController, children: [
              SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 210.0, left: 10, right: 10),
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.73,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 100.0),
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: 15,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: () {
                              Get.to(() => DetailsScreen());
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 5.0),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 100,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: ColorManager.lightGrey,
                                    width: 1.0,
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Padding(
                                        padding: const EdgeInsets.all(7.0),
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.2,
                                          height: 100,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: Image.asset(
                                            'assets/images/logo.png',
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.2,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 5,
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 10,
                                                left: 10,
                                                top: 10,
                                                bottom: 3),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'استراحة النور',
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.black54),
                                                ),
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
                                                        horizontal: 8.0),
                                                    child: Row(
                                                      children: [
                                                        Icon(
                                                          Icons
                                                              .location_on_sharp,
                                                          color: Colors.black45,
                                                          size: 12,
                                                        ),
                                                        Text(
                                                          '3.54 كم',
                                                          style: TextStyle(
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color:
                                                                Colors.black38,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 10.0,
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "صالتين غرفة",
                                                  style: TextStyle(
                                                      fontSize: 13,
                                                      color: Colors.black26),
                                                ),
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
                                                        horizontal: 8.0),
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
                                                            color:
                                                                Colors.black38,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 160.0, left: 10, right: 10),
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.8,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: 0,
                      itemBuilder: (BuildContext context, int index) {
                        return SizedBox();
                      },
                    ),
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 160.0, left: 10, right: 10),
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.8,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: 0,
                      itemBuilder: (BuildContext context, int index) {
                        return SizedBox();
                      },
                    ),
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 160.0, left: 10, right: 10),
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.8,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: 0,
                      itemBuilder: (BuildContext context, int index) {
                        return SizedBox();
                      },
                    ),
                  ),
                ),
              ),
            ]),
            Positioned(
              //  top: 5,
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 8.0, left: 8, top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                            onTap: () {},
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Icon(
                                Icons.menu,
                                size: 25,
                                color: Colors.grey[500],
                              ),
                            )),
                        InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: Icon(
                              Icons.arrow_forward_ios,
                              size: 22,
                              color: Colors.grey[500],
                            )),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 110,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color(0xFF87F8C0),
                              Color(0xFFF5F588),
                            ],
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                          ),
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Text(
                                  'Gatherings'.tr,
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: 10.0, right: 10, left: 10),
                    child: TabBar(
                      indicator: BoxDecoration(
                        color: Colors.transparent,
                      ),
                      isScrollable: true,
                      labelPadding: EdgeInsets.symmetric(horizontal: 5),
                      indicatorPadding: EdgeInsets.zero,
                      tabs: [
                        Tab(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 2.0),
                            child: Container(
                                width: MediaQuery.of(context).size.width * 0.2,
                                height: 28,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors:   selectedTab == 0 ?  [
                                      Color(0xFF87F8C0),
                                      Color(0xFFF5F588),
                                    ]:[Colors.grey,Colors.grey] ,
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                ),
                                child: Text(
                                  'شاليهات',
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: selectedTab == 0 ?  ColorManager.darkGrey : Colors.white,
                                      fontWeight: FontWeight.bold),
                                )),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2.0),
                          child: Container(
                              width: MediaQuery.of(context).size.width * 0.2,
                              height: 28,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors:    selectedTab == 1 ?  [
                                    Color(0xFF87F8C0),
                                    Color(0xFFF5F588),
                                  ]:[Colors.grey,Colors.grey] ,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                              ),
                              child: Text(
                                'شاليهات',
                                style: TextStyle(
                                    fontSize: 13,
                                    color: selectedTab == 1 ?  ColorManager.darkGrey : Colors.white,
                                    fontWeight: FontWeight.bold),
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2.0),
                          child: Container(
                              width: MediaQuery.of(context).size.width * 0.2,
                              height: 28,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors:  selectedTab == 2 ?  [
                                    Color(0xFF87F8C0),
                                    Color(0xFFF5F588),
                                  ]:[Colors.grey,Colors.grey] ,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                              ),
                              child: Text(
                                'شاليهات',
                                style: TextStyle(
                                    fontSize: 13,
                                    color: selectedTab == 2 ?  ColorManager.darkGrey : Colors.white,
                                    fontWeight: FontWeight.bold),
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2.0),
                          child: Container(
                              width: MediaQuery.of(context).size.width * 0.2,
                              height: 28,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: selectedTab == 3 ?  [
                                    Color(0xFF87F8C0),
                                    Color(0xFFF5F588),
                                  ]:[Colors.grey,Colors.grey] ,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                              ),
                              child: Text(
                                'شاليهات',
                                style: TextStyle(
                                    fontSize: 13,
                                    color: selectedTab == 3 ?  ColorManager.darkGrey : Colors.white,
                                    fontWeight: FontWeight.bold),
                              )),
                        ),
                      ],
                      controller: _tabController,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomSheetWidget(),
      ),
    );
  }
}
