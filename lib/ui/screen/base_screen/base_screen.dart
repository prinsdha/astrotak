import 'package:astrotak/core/constant/app_color.dart';
import 'package:astrotak/core/constant/app_icons.dart';
import 'package:astrotak/core/utils/config.dart';
import 'package:astrotak/global.dart';
import 'package:astrotak/ui/screen/base_screen/controller/base_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BaseScreen extends StatefulWidget {
  static const String routeName = "/baseScreen";
  const BaseScreen({Key? key}) : super(key: key);

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(BaseScreen.routeName),
      body: GetBuilder(
          builder: (BaseController controller) => IndexedStack(
                children: navigationScreens,
                index: controller.selectedTab,
              )),
      bottomNavigationBar: bottomBar(context),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.kPrimaryColor,
        child: const Icon(Icons.menu),
        onPressed: () {},
      ),
    );
  }

  BottomAppBar bottomBar(BuildContext context) {
    return BottomAppBar(
      elevation: 3,
      child: GetBuilder(
        builder: (BaseController controller) => Row(
          children: navigationTabList
              .asMap()
              .map((key, value) => MapEntry(
                  key,
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Get.find<BaseController>().selectedTab = key;
                      },
                      child: Container(
                        color: Colors.transparent,
                        height: 55,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 25,
                                width: 25,
                                child: Image.asset(
                                  value.icon,
                                  color: key == 4 || key == 0
                                      ? controller.selectedTab == key
                                          ? AppColor.kPrimaryColor
                                          : Colors.grey
                                      : controller.selectedTab == key
                                          ? AppColor.kPrimaryColor
                                          : null,
                                ),
                              ),
                              Text(
                                value.name,
                                maxLines: 1,
                                textAlign: TextAlign.center,
                                style: controller.selectedTab == key
                                    ? TextStyle(
                                        height: 1.5,
                                        color: AppColor.kPrimaryColor,
                                        fontSize: getWidth(7))
                                    : TextStyle(
                                        height: 1.5,
                                        color: Colors.black.withOpacity(0.60),
                                        fontSize: getWidth(7)),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  )))
              .values
              .toList(),
        ),
      ),
    );
  }
}

AppBar commonAppBar(String routeName) {
  return AppBar(
    leading: IconButton(
      onPressed: () {
        Get.back();
      },
      padding: const EdgeInsets.all(17),
      icon: routeName == BaseScreen.routeName
          ? Image.asset(AppIcons.hamBurger)
          : const Icon(
              Icons.arrow_back_ios,
              color: AppColor.kPrimaryColor,
            ),
    ),
    title: Image.asset(
      AppIcons.logo,
      height: 40,
    ),
    actions: [
      IconButton(
        onPressed: () {},
        padding: const EdgeInsets.all(14),
        icon: Image.asset(AppIcons.profile),
      ),
    ],
  );
}
