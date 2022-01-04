import 'package:astrotak/core/service/repo/almanac_repo.dart';
import 'package:astrotak/core/service/repo/location_place_repo.dart';
import 'package:astrotak/ui/screen/Tab-1/model/almanac_model.dart';
import 'package:astrotak/ui/screen/Tab-1/model/location_place_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  DateTime _dateTime = DateTime.now();

  DateTime get dateTime => _dateTime;

  set dateTime(DateTime value) {
    _dateTime = value;
    fetchAlmanac();
    update();
  }

  LocationData? selectedLocationData;

  Future<List<LocationData>> getSuggestions(String query) async {
    List<LocationData> matches = <LocationData>[];
    final response =
        await LocationPlaceRepo.getLocationPlace(urlEndString: query);

    matches = LocationPlaceModel.fromJson(response).data;

    return matches;
  }

  timePicker() {
    showDatePicker(
            context: Get.context as BuildContext,
            initialDate: dateTime,
            firstDate: DateTime(2000),
            lastDate: DateTime(2050))
        .then((value) => dateTime = value!)
        .catchError((e) {});
  }

  AlmanacData? almanacData;

  Future fetchAlmanac() async {
    if (selectedLocationData != null) {
      final response = await AlmanacRepo.getLocationPlace(
          placeId: selectedLocationData!.placeId, dateTime: dateTime);
      if (response != null) {
        almanacData = AlmanacModel.fromJson(response).data;
        update();
      }
    }
  }

  Tithi get tithi => almanacData!.tithi;
  Nakshatra get nakshtra => almanacData!.nakshatra;
  Yog get yog => almanacData!.yog;
  Karan get karan => almanacData!.karan;
  HinduMaah get hindumahh => almanacData!.hinduMaah;
  String get sunriseTime => almanacData!.sunrise;
  String get moonriseTime => almanacData!.moonrise;
  String get sunsetTme => almanacData!.sunset;
  String get moonSet => almanacData!.moonset;
  String get vedicSunrise => almanacData!.vedicSunrise;
  String get vedicSunset => almanacData!.vedicSunset;
  final TextEditingController textEditingController = TextEditingController();

  Future initialSearch() async {
    final response = await LocationPlaceRepo.getLocationPlace(
        urlEndString: textEditingController.text.trim());
    selectedLocationData = LocationPlaceModel.fromJson(response).data[0];
    fetchAlmanac();
    update();
  }

  @override
  void onInit() {
    textEditingController.text = "Delhi, India";
    initialSearch();
    super.onInit();
  }
}
