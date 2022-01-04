class AlmanacModel {
  AlmanacModel({
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
  AlmanacData data;

  factory AlmanacModel.fromJson(Map<String, dynamic> json) => AlmanacModel(
        httpStatus: json["httpStatus"] ?? "",
        httpStatusCode: json["httpStatusCode"] ?? -1,
        success: json["success"] ?? false,
        message: json["message"] ?? "",
        apiName: json["apiName"] ?? "",
        data: AlmanacData.fromJson(json["data"] ?? {}),
      );
}

class AlmanacData {
  AlmanacData({
    required this.day,
    required this.sunrise,
    required this.sunset,
    required this.moonrise,
    required this.moonset,
    required this.vedicSunrise,
    required this.vedicSunset,
    required this.tithi,
    required this.nakshatra,
    required this.yog,
    required this.karan,
    required this.hinduMaah,
    required this.paksha,
    required this.ritu,
    required this.sunSign,
    required this.moonSign,
    required this.ayana,
    required this.panchangYog,
    required this.vikramSamvat,
    required this.shakaSamvat,
    required this.vkramSamvatName,
    required this.shakaSamvatName,
    required this.dishaShool,
    required this.dishaShoolRemedies,
    required this.nakShool,
    required this.moonNivas,
    required this.abhijitMuhurta,
    required this.rahukaal,
    required this.guliKaal,
    required this.yamghantKaal,
  });

  String day;
  String sunrise;
  String sunset;
  String moonrise;
  String moonset;
  String vedicSunrise;
  String vedicSunset;
  Tithi tithi;
  Nakshatra nakshatra;
  Yog yog;
  Karan karan;
  HinduMaah hinduMaah;
  String paksha;
  String ritu;
  String sunSign;
  String moonSign;
  String ayana;
  String panchangYog;
  int vikramSamvat;
  int shakaSamvat;
  String vkramSamvatName;
  String shakaSamvatName;
  String dishaShool;
  String dishaShoolRemedies;
  NakShool nakShool;
  String moonNivas;
  AbhijitMuhurta abhijitMuhurta;
  AbhijitMuhurta rahukaal;
  AbhijitMuhurta guliKaal;
  AbhijitMuhurta yamghantKaal;

  factory AlmanacData.fromJson(Map<String, dynamic> json) => AlmanacData(
        day: json["day"] ?? "",
        sunrise: json["sunrise"] ?? "",
        sunset: json["sunset"] ?? "",
        moonrise: json["moonrise"] ?? "",
        moonset: json["moonset"] ?? "",
        vedicSunrise: json["vedic_sunrise"] ?? "",
        vedicSunset: json["vedic_sunset"] ?? "",
        tithi: Tithi.fromJson(json["tithi"] ?? {}),
        nakshatra: Nakshatra.fromJson(json["nakshatra"] ?? {}),
        yog: Yog.fromJson(json["yog"] ?? {}),
        karan: Karan.fromJson(json["karan"] ?? {}),
        hinduMaah: HinduMaah.fromJson(json["hindu_maah"] ?? {}),
        paksha: json["paksha"] ?? "",
        ritu: json["ritu"] ?? "",
        sunSign: json["sun_sign"] ?? "",
        moonSign: json["moon_sign"] ?? "",
        ayana: json["ayana"] ?? "",
        panchangYog: json["panchang_yog"] ?? "",
        vikramSamvat: json["vikram_samvat"] ?? -1,
        shakaSamvat: json["shaka_samvat"] ?? -1,
        vkramSamvatName: json["vkram_samvat_name"] ?? "",
        shakaSamvatName: json["shaka_samvat_name"] ?? "",
        dishaShool: json["disha_shool"] ?? "",
        dishaShoolRemedies: json["disha_shool_remedies"] ?? "",
        nakShool: NakShool.fromJson(json["nak_shool"] ?? {}),
        moonNivas: json["moon_nivas"] ?? "",
        abhijitMuhurta: AbhijitMuhurta.fromJson(json["abhijit_muhurta"] ?? {}),
        rahukaal: AbhijitMuhurta.fromJson(json["rahukaal"] ?? {}),
        guliKaal: AbhijitMuhurta.fromJson(json["guliKaal"] ?? {}),
        yamghantKaal: AbhijitMuhurta.fromJson(json["yamghant_kaal"] ?? {}),
      );
}

class AbhijitMuhurta {
  AbhijitMuhurta({
    required this.start,
    required this.end,
  });

  String start;
  String end;

  factory AbhijitMuhurta.fromJson(Map<String, dynamic> json) => AbhijitMuhurta(
        start: json["start"] ?? "",
        end: json["end"] ?? "",
      );
}

class HinduMaah {
  HinduMaah({
    required this.adhikStatus,
    required this.purnimanta,
    required this.amanta,
    required this.amantaId,
    required this.purnimantaId,
  });

  bool adhikStatus;
  String purnimanta;
  String amanta;
  int amantaId;
  int purnimantaId;

  factory HinduMaah.fromJson(Map<String, dynamic> json) => HinduMaah(
        adhikStatus: json["adhik_status"] ?? false,
        purnimanta: json["purnimanta"] ?? "",
        amanta: json["amanta"] ?? "",
        amantaId: json["amanta_id"] ?? -1,
        purnimantaId: json["purnimanta_id"] ?? -1,
      );
}

class Karan {
  Karan({
    required this.details,
    required this.endTime,
    required this.endTimeMs,
  });

  KaranDetails details;
  EndTime endTime;
  int endTimeMs;

  factory Karan.fromJson(Map<String, dynamic> json) => Karan(
        details: KaranDetails.fromJson(json["details"] ?? {}),
        endTime: EndTime.fromJson(json["end_time"] ?? {}),
        endTimeMs: json["end_time_ms"] ?? -1,
      );
}

class KaranDetails {
  KaranDetails({
    required this.karanNumber,
    required this.karanName,
    required this.special,
    required this.deity,
  });

  int karanNumber;
  String karanName;
  String special;
  String deity;

  factory KaranDetails.fromJson(Map<String, dynamic> json) => KaranDetails(
        karanNumber: json["karan_number"] ?? -1,
        karanName: json["karan_name"] ?? "",
        special: json["special"] ?? "",
        deity: json["deity"] ?? "",
      );
}

class EndTime {
  EndTime({
    required this.hour,
    required this.minute,
    required this.second,
  });

  int hour;
  int minute;
  int second;

  factory EndTime.fromJson(Map<String, dynamic> json) => EndTime(
        hour: json["hour"] ?? -1,
        minute: json["minute"] ?? -1,
        second: json["second"] ?? -1,
      );
}

class NakShool {
  NakShool({
    required this.direction,
    required this.remedies,
  });

  String direction;
  String remedies;

  factory NakShool.fromJson(Map<String, dynamic> json) => NakShool(
        direction: json["direction"] ?? "",
        remedies: json["remedies"] ?? "",
      );
}

class Nakshatra {
  Nakshatra({
    required this.details,
    required this.endTime,
    required this.endTimeMs,
  });

  NakshatraDetails details;
  EndTime endTime;
  int endTimeMs;

  factory Nakshatra.fromJson(Map<String, dynamic> json) => Nakshatra(
        details: NakshatraDetails.fromJson(json["details"] ?? {}),
        endTime: EndTime.fromJson(json["end_time"] ?? {}),
        endTimeMs: json["end_time_ms"] ?? -1,
      );
}

class NakshatraDetails {
  NakshatraDetails({
    required this.nakNumber,
    required this.nakName,
    required this.ruler,
    required this.deity,
    required this.special,
    required this.summary,
  });

  int nakNumber;
  String nakName;
  String ruler;
  String deity;
  String special;
  String summary;

  factory NakshatraDetails.fromJson(Map<String, dynamic> json) =>
      NakshatraDetails(
        nakNumber: json["nak_number"] ?? -1,
        nakName: json["nak_name"] ?? "",
        ruler: json["ruler"] ?? "",
        deity: json["deity"] ?? "",
        special: json["special"] ?? "",
        summary: json["summary"] ?? "",
      );
}

class Tithi {
  Tithi({
    required this.details,
    required this.endTime,
    required this.endTimeMs,
  });

  TithiDetails details;
  EndTime endTime;
  int endTimeMs;

  factory Tithi.fromJson(Map<String, dynamic> json) => Tithi(
        details: TithiDetails.fromJson(json["details"] ?? {}),
        endTime: EndTime.fromJson(json["end_time"] ?? {}),
        endTimeMs: json["end_time_ms"] ?? -1,
      );
}

class TithiDetails {
  TithiDetails({
    required this.tithiNumber,
    required this.tithiName,
    required this.special,
    required this.summary,
    required this.deity,
  });

  int tithiNumber;
  String tithiName;
  String special;
  String summary;
  String deity;

  factory TithiDetails.fromJson(Map<String, dynamic> json) => TithiDetails(
        tithiNumber: json["tithi_number"] ?? -1,
        tithiName: json["tithi_name"] ?? "",
        special: json["special"] ?? "",
        summary: json["summary"] ?? "",
        deity: json["deity"] ?? "",
      );
}

class Yog {
  Yog({
    required this.details,
    required this.endTime,
    required this.endTimeMs,
  });

  YogDetails details;
  EndTime endTime;
  int endTimeMs;

  factory Yog.fromJson(Map<String, dynamic> json) => Yog(
        details: YogDetails.fromJson(json["details"] ?? {}),
        endTime: EndTime.fromJson(json["end_time"] ?? {}),
        endTimeMs: json["end_time_ms"] ?? -1,
      );
}

class YogDetails {
  YogDetails({
    required this.yogNumber,
    required this.yogName,
    required this.special,
    required this.meaning,
  });

  int yogNumber;
  String yogName;
  String special;
  String meaning;

  factory YogDetails.fromJson(Map<String, dynamic> json) => YogDetails(
        yogNumber: json["yog_number"] ?? -1,
        yogName: json["yog_name"] ?? "",
        special: json["special"] ?? "",
        meaning: json["meaning"] ?? "",
      );
}
