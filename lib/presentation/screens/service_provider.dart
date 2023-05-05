import 'package:ala_ween/date_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import '../resources/color_manager.dart';
import '../widgets/bottom_sheet.dart';

class ServiceProvider extends StatefulWidget {
  const ServiceProvider({Key? key}) : super(key: key);

  @override
  State<ServiceProvider> createState() => _ServiceProviderState();
}

class _ServiceProviderState extends State<ServiceProvider> {
  List<DateInfo> dates = [
    DateInfo(
      date: DateTime(2023, 5, 3),
      times: {
        "01:30": Colors.grey,
        "03:15": Colors.green,
        "09:10": Colors.greenAccent
      },
    ),
    DateInfo(
      date: DateTime(2023, 5, 5),
      times: {
        "01:30": Colors.grey,
        "03:15": Colors.green,
        "09:10": Colors.greenAccent
      },
    ),
  ];

  bool isSameDate(DateTime element, DateTime tappedDay) {
    return element.year == tappedDay.year &&
        element.month == tappedDay.month &&
        element.day == tappedDay.day;
  }

  DateInfo? isValidDaySelected(DateTime tappedDay) {
    return dates
        .firstWhereOrNull((element) => isSameDate(element.date, tappedDay));
  }

  DateInfo? selectedDayInfo;

  void selectDay(DateTime day) {
    var di = isValidDaySelected(day);
    if (di == null) {
      Get.defaultDialog(
          title: "Error", content: Text("Please select other day."));
      return;
    }
    selectedDayInfo = di;
    selectedTime = null;
    setState(() {});
  }

  String? selectedTime;

  void selectTime(String newSelectedTime) {
    selectedTime = newSelectedTime;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xFFF4F2F2),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Container(
                width: double.infinity,
                child: Text(
                  'Service provider name'.tr,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Color(0xFF27D685),
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: InkWell(
                      onTap: () {
                        Get.to(() => ServiceProvider());
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
                                ColorManager.gradiantLeftLight,
                                ColorManager.gradiantRightLight,
                              ],
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(30)),
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
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: InkWell(
                      onTap: () {
                        Get.to(() => ServiceProvider());
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
                                ColorManager.gradiantLeftLight,
                                ColorManager.gradiantRightLight,
                              ],
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Container(
                                    width: 35,
                                    height: 35,
                                    child:
                                        Image.asset('assets/images/img.png')),
                              ),
                              Text(
                                'Book'.tr,
                                style: TextStyle(
                                    fontSize: 15,
                                    color: ColorManager.darkGrey,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          )),
                    ),
                  ),
                ],
              ),
              Container(
                child: TableCalendar(
                  calendarBuilders: CalendarBuilders(todayBuilder:
                      (BuildContext context, DateTime day,
                          DateTime focusedDay) {
                    return Text(day.day.toString(),
                        style: TextStyle(
                          color: Colors.yellow,
                        ));
                  }, selectedBuilder: (BuildContext context, DateTime day,
                      DateTime focusedDay) {
                    return Text(day.day.toString(),
                        style: TextStyle(
                          color: Colors.green,
                        ));
                  }, defaultBuilder: (BuildContext context, DateTime day,
                      DateTime focusedDay) {
                    return Text(day.day.toString(),
                        style: TextStyle(
                          color: isValidDaySelected(day) == null
                              ? Colors.red
                              : Colors.black,
                        ));
                  }),
                  firstDay: DateTime(2022, 5, 1),
                  lastDay: DateTime.now().add(Duration(days: 30)),
                  focusedDay: DateTime.now(),
                  selectedDayPredicate: (d) => selectedDayInfo != null
                      ? isSameDate(d, selectedDayInfo!.date)
                      : false,
                  onDaySelected: (d, ds) {
                    selectDay(d);
                  },
                ),
              ),
              Container(
                // width: MediaQuery.of(context).size.width,
                height: 100,
                child: selectedDayInfo != null
                    ? ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: dates
                            .firstWhere((element) =>
                                isSameDate(element.date, selectedDayInfo!.date))
                            .times
                            .length,
                        itemBuilder: (ctx, index) => InkWell(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                  backgroundColor: selectedDayInfo!.times.keys
                                              .toList()[index] ==
                                          selectedTime
                                      ? Colors.black
                                      : selectedDayInfo!.times.values
                                          .toList()[index],
                                  elevation: 0,
                                ),
                                child: Text(selectedDayInfo!.times.keys
                                    .toList()[index]),
                                onPressed: () {
                                  selectTime(selectedDayInfo!.times.keys
                                      .toList()[index]);
                                },
                              ),
                            ))
                    : Text("No Times"),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomSheetWidget(),
    ));
  }
}
