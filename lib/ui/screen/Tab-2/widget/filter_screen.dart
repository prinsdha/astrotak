import 'package:astrotak/core/constant/app_color.dart';
import 'package:astrotak/core/constant/app_settings.dart';
import 'package:astrotak/core/utils/config.dart';
import 'package:astrotak/ui/screen/Tab-2/controller/talk_to_astrologer_controller.dart';
import 'package:astrotak/ui/screen/base_screen/base_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterScreen extends StatefulWidget {
  static const String routeName = "/filterScreen";
  const FilterScreen({Key? key}) : super(key: key);
  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  final TalkToAstrologerController talkToAstrologerController =
      Get.find<TalkToAstrologerController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(FilterScreen.routeName),
      body: Row(
        children: [
          Container(
            width: 130,
            color: Colors.grey.withOpacity(0.10),
            child: ListView(
              children: talkToAstrologerController.allFilters
                  .asMap()
                  .map((key, value) => MapEntry(
                      key,
                      ListTile(
                        onTap: () {
                          talkToAstrologerController.selectedFilterSection =
                              value;
                        },
                        title: Text(
                          value,
                          style: TextStyle(fontSize: getWidth(15)),
                        ),
                      )))
                  .values
                  .toList(),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: GetBuilder(
                    builder: (TalkToAstrologerController controller) {
                      return ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: controller.getCurrentFilterList!.length,
                          itemBuilder: (context, index) {
                            String text =
                                controller.getCurrentFilterList![index];
                            return ListTile(
                              title: Text(
                                text,
                                style: TextStyle(fontSize: getWidth(15)),
                              ),
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 25),
                              trailing: Checkbox(
                                value: controller.appliedFilters[
                                        controller.selectedFilterSection]!
                                    .contains(text),
                                onChanged: (val) {
                                  if (val!) {
                                    controller.appliedFilters[
                                            controller.selectedFilterSection]!
                                        .add(text);
                                  } else {
                                    controller.appliedFilters[
                                            controller.selectedFilterSection]!
                                        .remove(text);
                                  }
                                  controller.update();
                                },
                                activeColor: AppColor.kPrimaryColor,
                              ),
                            );
                          });
                    },
                  ),
                ),
                SafeArea(
                  child: GestureDetector(
                    onTap: () {
                      talkToAstrologerController.astrologerDataDup =
                          talkToAstrologerController.filterThroughSkill;
                      talkToAstrologerController.update();
                      Get.back();
                    },
                    child: Container(
                      height: 45,
                      width: Get.width,
                      margin: const EdgeInsets.symmetric(
                          horizontal: kDefaultPadding),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: AppColor.kPrimaryColor),
                      child: const Center(
                        child: Text(
                          'Apply',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
