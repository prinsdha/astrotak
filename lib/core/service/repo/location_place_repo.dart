import '../api_handler.dart';
import '../api_routes.dart';

class LocationPlaceRepo {
  static Future getLocationPlace({required String urlEndString}) async {
    final response = await API.apiHandler(
        url: APIRoutes.locationPlace + "?inputPlace=$urlEndString",
        showLoader: false,
        showToast: false,
        requestType: RequestApiType.get);
    if (response != null) {
      return response;
    }
  }
}
