import 'package:astrotak/core/constant/app_color.dart';

import 'package:astrotak/core/constant/app_settings.dart';
import 'package:astrotak/core/utils/app_functions.dart';
import 'package:astrotak/core/utils/config.dart';

import 'package:astrotak/ui/screen/Tab-1/widgets/description_view.dart';
import 'package:astrotak/ui/shared/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'controller/home_controller.dart';
import 'model/location_place_model.dart';
import 'widgets/time_structure_of_day.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 5,
          ),
          firstHeader(),
          const SizedBox(
            height: 7,
          ),
          descriptionText(
              "India is a country known for its festival but knowing that exact dates can sometimes be difficult. To ensure you do not miss out on critical dates we bring you the daily panchang."),
          const SizedBox(
            height: 7,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: AppColor.kPrimaryColorOverlay,
            ),
            padding: const EdgeInsets.symmetric(
                horizontal: kDefaultPadding, vertical: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                dateField(),
                const SizedBox(
                  height: 15,
                ),
                locationField(),
              ],
            ),
          ),
          const TimeStructureOfDay(),
          const DescriptionView(),
        ],
      ),
    );
  }

  Widget locationField() {
    return GetBuilder(
      builder: (HomeController controller) => Row(
        children: [
          orangeBoxTitle("Location:"),
          Expanded(
            child: TypeAheadFormField(
              textFieldConfiguration: TextFieldConfiguration(
                  controller: controller.textEditingController,
                  style: TextStyle(
                      fontSize: getWidth(16),
                      color: Colors.black.withOpacity(0.50)),
                  decoration: InputDecoration(
                      hintText: "Search Location",
                      border: InputBorder.none,
                      fillColor: AppColor.kScaffoldColor,
                      filled: true,
                      hintStyle:
                          TextStyle(color: Colors.black.withOpacity(0.30)))),
              suggestionsCallback: (pattern) async {
                return controller.getSuggestions(pattern);
              },
              loadingBuilder: (context) => const AppLoader(),
              errorBuilder: (context, error) => const SizedBox(),
              itemBuilder: (context, LocationData locationData) {
                return ListTile(
                  title: Text(
                    locationData.placeName,
                    style: TextStyle(
                        fontSize: getWidth(16),
                        color: Colors.black.withOpacity(0.50)),
                  ),
                );
              },
              transitionBuilder: (context, suggestionsBox, controller) {
                return suggestionsBox;
              },
              onSaved: (val) {},
              onSuggestionSelected: (LocationData locationData) {
                controller.textEditingController.text = locationData.placeName;
                controller.selectedLocationData = locationData;
                controller.fetchAlmanac();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget dateField() {
    return Row(
      children: [
        orangeBoxTitle("Date:"),
        GetBuilder(
          builder: (HomeController controller) => Expanded(
            child: GestureDetector(
              onTap: () {
                controller.timePicker();
              },
              child: Container(
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 5),
                decoration: const BoxDecoration(color: AppColor.kScaffoldColor),
                child: Row(
                  children: [
                    Text(
                      "${DateFormat("d").format(controller.dateTime)}${getDayOfMonthSuffix(controller.dateTime.day)} ${DateFormat("MMMM, yyyy").format(controller.dateTime)}",
                      style: TextStyle(
                          fontSize: getWidth(16),
                          color: Colors.black.withOpacity(0.50)),
                    ),
                    const Spacer(),
                    const Icon(Icons.arrow_drop_down),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  SizedBox orangeBoxTitle(String text) {
    return SizedBox(
      width: 80,
      child: Center(
        child: Text(
          text,
          style: TextStyle(
              fontSize: getWidth(16), color: Colors.black.withOpacity(0.50)),
        ),
      ),
    );
  }

  Text descriptionText(String text) {
    return Text(
      text,
      style: TextStyle(
          fontSize: getWidth(12), color: Colors.black.withOpacity(0.50)),
    );
  }

  Widget firstHeader() {
    return Row(
      children: [
        const Icon(
          Icons.arrow_back_ios_rounded,
          size: 17,
        ),
        const SizedBox(
          width: 3,
        ),
        Text(
          "Daily Panchang",
          style: TextStyle(fontSize: getWidth(17), fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
