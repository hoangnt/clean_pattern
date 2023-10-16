import 'package:clean_pattern/common/constant/app_color.dart';
import 'package:clean_pattern/features/home/presentation/controller/entry_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EntryScreen extends StatelessWidget {
  final _controller = Get.find<EntryController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("We eat Ramen together"),
      ),
      body: GetBuilder<EntryController>(builder: (_) {
        return PageView.builder(
          itemCount: _controller.listScreen.length,
          controller: _controller.pageController,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => _controller.listScreen[index],
        );
      }),
      bottomNavigationBar: GetBuilder<EntryController>(
        builder: (_) => BottomNavigationBar(
          currentIndex: _controller.selectedIndex,
          onTap: _controller.onSelectBottomBar,
          backgroundColor: Colors.white,
          unselectedItemColor: Colors.grey,
          selectedItemColor: AppColor.primary,
          showUnselectedLabels: false,
          showSelectedLabels: true,
          type: BottomNavigationBarType.fixed,
          selectedIconTheme: IconThemeData(
            size: 25,
            color: AppColor.primary,
          ),
          unselectedIconTheme: IconThemeData(size: 22),
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.store_rounded),
              label: 'Store',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}
