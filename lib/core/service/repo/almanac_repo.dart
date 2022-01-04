import 'dart:convert';

import 'package:astrotak/ui/screen/Tab-2/model/all_astrologer_model.dart';

import '../api_handler.dart';
import '../api_routes.dart';

class AlmanacRepo {
  static Future getLocationPlace(
      {required String placeId, required DateTime dateTime}) async {
    final response = await API.apiHandler(
        url: APIRoutes.dailyPanchang,
        header: {
          'Content-type': 'application/json',
        },
        body: jsonEncode({
          "day": dateTime.day,
          "month": dateTime.month,
          "year": dateTime.year,
          "placeId": placeId
        }),
        showLoader: false,
        showToast: false,
        requestType: RequestApiType.post);
    if (response != null) {
      return response;
    }
  }

  static Future<AllAstrologerModel?> getAllAstrologers() async {
    final response = await API.apiHandler(
        url: APIRoutes.getAllAgent, requestType: RequestApiType.get);
    if (response != null) {
      return AllAstrologerModel.fromJson(response);
    }
  }
}
