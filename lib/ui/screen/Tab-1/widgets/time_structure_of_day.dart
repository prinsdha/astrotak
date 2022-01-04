import 'package:astrotak/core/constant/app_color.dart';
import 'package:astrotak/core/constant/app_icons.dart';
import 'package:astrotak/core/utils/config.dart';
import 'package:astrotak/ui/screen/Tab-1/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TimeStructureOfDay extends StatelessWidget {
  const TimeStructureOfDay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: AppColor.kScaffoldColor,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.10),
                offset: const Offset(0, 2),
                blurRadius: 1)
          ]),
      child: GetBuilder(
        builder: (HomeController controller) => controller.almanacData != null
            ? SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    timeOfCityBox(
                        title: "Sunrise",
                        image: AppIcons.sunrise,
                        time: controller.sunriseTime),
                    timeOfCityBox(
                        title: "Sunset",
                        image: AppIcons.sunrise,
                        time: controller.sunsetTme),
                    timeOfCityBox(
                        title: "Moonrise",
                        image: AppIcons.moonSet,
                        time: controller.moonriseTime),
                    timeOfCityBox(
                        title: "Moonset",
                        image: AppIcons.moonSet,
                        time: controller.moonSet),
                    timeOfCityBox(
                        title: "Vedic Sunrise",
                        image: AppIcons.ayana,
                        time: controller.vedicSunrise),
                    timeOfCityBox(
                        title: "Vedic Sunset",
                        image: AppIcons.ayana,
                        time: controller.vedicSunset),
                  ],
                ),
              )
            : const SizedBox(),
      ),
    );
  }

  Container timeOfCityBox(
      {required String image, required String time, required String title}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: "Vedic Sunset" == title
          ? null
          : const BoxDecoration(
              border: Border(right: BorderSide(color: Colors.grey))),
      child: Row(
        children: [
          Image.asset(
            image,
            color: Colors.indigoAccent,
            height: 17,
          ),
          const SizedBox(
            width: 5,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(title,
                  style: TextStyle(
                      color: Colors.indigoAccent, fontSize: getWidth(10))),
              Text(
                time,
                style: TextStyle(
                    fontSize: getWidth(12),
                    color: Colors.black.withOpacity(0.50)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
