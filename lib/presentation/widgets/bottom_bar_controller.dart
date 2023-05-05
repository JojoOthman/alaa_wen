import 'package:get/get.dart';

class BottomBarController extends GetxController {
  int _selectedTab = 0;

  int get selectedTab => _selectedTab;

  void updateSelectedTab(int newIndex) {
    _selectedTab = newIndex;
    update();
  }
}
