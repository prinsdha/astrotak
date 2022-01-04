class LocationPlaceModel {
  LocationPlaceModel({
    required this.httpStatus,
    required this.httpStatusCode,
    required this.success,
    required this.message,
    required this.apiName,
    required this.data,
  });

  String httpStatus;
  int httpStatusCode;
  bool success;
  String message;
  String apiName;
  List<LocationData> data;

  factory LocationPlaceModel.fromJson(Map<String, dynamic> json) =>
      LocationPlaceModel(
        httpStatus: json["httpStatus"],
        httpStatusCode: json["httpStatusCode"],
        success: json["success"],
        message: json["message"],
        apiName: json["apiName"],
        data: List<LocationData>.from(
            json["data"].map((x) => LocationData.fromJson(x))),
      );
}

class LocationData {
  LocationData({
    required this.placeName,
    required this.placeId,
  });

  String placeName;
  String placeId;

  factory LocationData.fromJson(Map<String, dynamic> json) => LocationData(
        placeName: json["placeName"],
        placeId: json["placeId"],
      );
}
