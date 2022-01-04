import 'package:astrotak/core/utils/config.dart';
import 'package:astrotak/ui/screen/Tab-1/controller/home_controller.dart';
import 'package:astrotak/ui/screen/Tab-1/model/almanac_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DescriptionView extends StatelessWidget {
  const DescriptionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GetBuilder(
        builder: (HomeController controller) => controller.almanacData != null
            ? ListView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(vertical: 10),
                children: [
                  headerOfData("Tithi"),
                  descriptionDetail(
                      "Tithi Number", controller.tithi.details.tithiNumber),
                  descriptionDetail(
                      "Tithi Name", controller.tithi.details.tithiName),
                  descriptionDetail(
                      "Special", controller.tithi.details.special),
                  descriptionDetail(
                      "Summary", controller.tithi.details.summary),
                  descriptionDetail("Deity", controller.tithi.details.deity),
                  descriptionDetail(
                      "End Time", timeString(controller.tithi.endTime)),
                  headerOfData("Nakshtra"),
                  descriptionDetail(
                      "Nakshtra Number", controller.nakshtra.details.nakNumber),
                  descriptionDetail(
                      "Nakshtra Name", controller.nakshtra.details.nakName),
                  descriptionDetail("Ruler", controller.nakshtra.details.ruler),
                  descriptionDetail(
                      "Special", controller.nakshtra.details.special),
                  descriptionDetail(
                      "Summary", controller.tithi.details.summary),
                  descriptionDetail("Deity", controller.tithi.details.deity),
                  descriptionDetail(
                      "End Time", timeString(controller.nakshtra.endTime)),
                  headerOfData("Yog"),
                  descriptionDetail(
                      "Yog Number", controller.yog.details.yogNumber),
                  descriptionDetail("Yog Name", controller.yog.details.yogName),
                  descriptionDetail("Special", controller.yog.details.special),
                  descriptionDetail("Meaning", controller.yog.details.meaning),
                  descriptionDetail(
                      "End Time", timeString(controller.yog.endTime)),
                  headerOfData("Karan"),
                  descriptionDetail(
                      "Karan Number", controller.karan.details.karanName),
                  descriptionDetail(
                      "Karan Name", controller.karan.details.karanName),
                  descriptionDetail(
                      "Special", controller.karan.details.special),
                  descriptionDetail("Diety", controller.karan.details.deity),
                  descriptionDetail(
                      "End Time", timeString(controller.karan.endTime)),
                  headerOfData("Hindu maah"),
                  descriptionDetail(
                      "Purnimanta", controller.hindumahh.purnimanta),
                  descriptionDetail("Amanta", controller.hindumahh.amanta),
                ],
              )
            : const SizedBox(),
      ),
    );
  }

  descriptionDetail(String key, dynamic value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        children: [
          Expanded(
              child: Text(
            "$key:",
            style: TextStyle(
                fontSize: getWidth(12), color: Colors.black.withOpacity(0.50)),
          )),
          Expanded(
              child: Text(
            "$value",
            style: TextStyle(
                fontSize: getWidth(12), color: Colors.black.withOpacity(0.50)),
          ))
        ],
      ),
    );
  }

  String timeString(EndTime endTime) {
    return "${endTime.hour} hr ${endTime.minute} min ${endTime.second} sec";
  }

  headerOfData(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, top: 15),
      child: Text(
        text,
        style: TextStyle(fontSize: getWidth(14)),
      ),
    );
  }
}
