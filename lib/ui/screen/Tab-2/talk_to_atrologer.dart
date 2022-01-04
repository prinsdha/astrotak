import 'package:astrotak/core/constant/app_color.dart';
import 'package:astrotak/core/constant/app_icons.dart';
import 'package:astrotak/core/constant/app_settings.dart';
import 'package:astrotak/core/utils/config.dart';
import 'package:astrotak/ui/screen/Tab-2/controller/talk_to_astrologer_controller.dart';
import 'package:astrotak/ui/screen/Tab-2/model/all_astrologer_model.dart';
import 'package:astrotak/ui/screen/Tab-2/widget/filter_screen.dart';
import 'package:astrotak/ui/screen/Tab-2/widget/search_field.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widget/custom_radio_button.dart';

class TalkToAstrologer extends StatefulWidget {
  const TalkToAstrologer({Key? key}) : super(key: key);

  @override
  State<TalkToAstrologer> createState() => _TalkToAstrologerState();
}

class _TalkToAstrologerState extends State<TalkToAstrologer> {
  final TalkToAstrologerController talkToAstrologerController =
      Get.find<TalkToAstrologerController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 5,
        ),
        firstHeader(context),
        const SearchField(),
        GetBuilder(
          builder: (TalkToAstrologerController controller) => Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                controller.fetchAllAgents();
              },
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                itemCount: controller.searchText.text.length > 1
                    ? controller.searchAstrologer.length
                    : controller.astrologerSortList.length,
                itemBuilder: (context, index) {
                  if (controller.astrologerDataDup.isEmpty) {
                    return const SizedBox();
                  }
                  return astrologerIdentityBox(
                      controller.searchText.text.length > 1
                          ? controller.searchAstrologer[index]
                          : controller.astrologerSortList[index]);
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  Container astrologerIdentityBox(AstrologerData astrologerData) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
              bottom:
                  BorderSide(color: Colors.grey.withOpacity(0.60), width: 1))),
      margin: const EdgeInsets.only(bottom: 10, top: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
                color: Colors.grey,
                image: DecorationImage(
                  image: NetworkImage(astrologerData.images.medium.imageUrl),
                  fit: BoxFit.cover,
                  onError: (exception, stackTrace) => Container(
                    height: 80,
                    width: 80,
                    color: Colors.grey.withOpacity(0.50),
                  ),
                )),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${astrologerData.firstName} ${astrologerData.lastName}",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: getWidth(15)),
                ),
                const SizedBox(
                  height: 7,
                ),
                astrologersDescription(astrologerData)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Text(
              "${astrologerData.experience.toInt()} Years",
              style: TextStyle(
                  fontSize: getWidth(12),
                  color: Colors.black.withOpacity(0.50)),
            ),
          ),
        ],
      ),
    );
  }

  astrologersDescription(AstrologerData astrologerData) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              AppIcons.skill,
              height: 15,
              color: AppColor.kPrimaryColor,
            ),
            const SizedBox(
              width: 7,
            ),
            Expanded(
              child: Text(
                talkToAstrologerController.getSkills(astrologerData).isEmpty
                    ? "-"
                    : talkToAstrologerController.getSkills(astrologerData),
                style: TextStyle(
                    fontSize: getWidth(12),
                    color: Colors.black.withOpacity(0.50)),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 3,
        ),
        Row(
          children: [
            Image.asset(
              AppIcons.language,
              color: AppColor.kPrimaryColor,
              height: 15,
            ),
            const SizedBox(
              width: 7,
            ),
            Text(
              talkToAstrologerController.getLanguages(astrologerData),
              style: TextStyle(
                  fontSize: getWidth(12),
                  color: Colors.black.withOpacity(0.50)),
            ),
          ],
        ),
        const SizedBox(
          height: 3,
        ),
        Row(
          children: [
            Image.asset(
              AppIcons.fees,
              color: AppColor.kPrimaryColor,
              height: 15,
            ),
            const SizedBox(
              width: 7,
            ),
            Text(
              "₹${astrologerData.minimumCallDurationCharges.toInt()}/ Min",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: getWidth(12)),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          height: 38,
          width: 140,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                    offset: const Offset(0, 2),
                    blurRadius: 5,
                    color: Colors.black.withOpacity(0.30))
              ],
              color: AppColor.kPrimaryColor),
          child: Row(
            children: [
              const Spacer(),
              Icon(
                Icons.call,
                color: Colors.white.withOpacity(0.80),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                "Take on Call",
                style: TextStyle(
                    fontSize: getWidth(13),
                    color: Colors.white.withOpacity(0.90)),
              ),
              const Spacer(
                flex: 2,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }

  Widget firstHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Row(
        children: [
          Text(
            "Talk to an Astrologer",
            style:
                TextStyle(fontSize: getWidth(17), fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          GestureDetector(
              onTap: () {
                talkToAstrologerController.isSearchOn = true;
                talkToAstrologerController.resetFilter();
              },
              child: commonHeaderButton(AppIcons.search)),
          GestureDetector(
              onTap: () {
                Get.toNamed(FilterScreen.routeName);
              },
              child: commonHeaderButton(AppIcons.filter)),
          GetBuilder(
            builder: (TalkToAstrologerController controller) =>
                DropdownButtonHideUnderline(
                    child: DropdownButton2(
              items: [
                DropdownMenuItem(
                  value: "",
                  child: Container(
                    height: 40,
                    width: Get.width,
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: Colors.black.withOpacity(0.50)))),
                    alignment: Alignment.centerLeft,
                    margin:
                        const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                    child: Text(
                      "Sort By",
                      style: TextStyle(
                          color: AppColor.kPrimaryColor,
                          fontSize: getWidth(14)),
                    ),
                  ),
                ),
                ...controller.sortList
                    .map((sort) => DropdownMenuItem<String>(
                        value: sort,
                        child: Container(
                          height: 40,
                          color: Colors.transparent,
                          child: CustomRadioButton(
                            sort: sort,
                          ),
                        )))
                    .toList()
              ],
              customButton: commonHeaderButton(AppIcons.sort),
              value: controller.selectedSort,
              onChanged: (value) {
                controller.selectedSort = value.toString();
              },
              itemHeight: 45,
              itemWidth: 240,
              dropdownPadding: const EdgeInsets.only(top: 5, bottom: 10),
              itemPadding: EdgeInsets.zero,
            )),
          ),
        ],
      ),
    );
  }

  Widget commonHeaderButton(String image) {
    return Container(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(
          image,
          height: 21,
        ),
      ),
    );
  }
}
