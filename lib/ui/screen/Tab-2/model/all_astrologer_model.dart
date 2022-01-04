class AllAstrologerModel {
  AllAstrologerModel({
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
  List<AstrologerData> data;

  factory AllAstrologerModel.fromJson(Map<String, dynamic> json) =>
      AllAstrologerModel(
        httpStatus: json["httpStatus"] ?? "",
        httpStatusCode: json["httpStatusCode"] ?? -1,
        success: json["success"] ?? false,
        message: json["message"] ?? "",
        apiName: json["apiName"] ?? "",
        data: List<AstrologerData>.from(
            (json["data"] ?? []).map((x) => AstrologerData.fromJson(x))),
      );
}

class AstrologerData {
  AstrologerData({
    required this.id,
    required this.urlSlug,
    required this.namePrefix,
    required this.firstName,
    required this.lastName,
    required this.aboutMe,
    this.profliePicUrl,
    required this.experience,
    required this.languages,
    required this.minimumCallDuration,
    required this.minimumCallDurationCharges,
    required this.additionalPerMinuteCharges,
    required this.isAvailable,
    required this.rating,
    required this.skills,
    required this.isOnCall,
    required this.freeMinutes,
    required this.additionalMinute,
    required this.images,
    required this.availability,
    required this.fullName,
  });

  int id;
  String urlSlug;
  String namePrefix;
  String firstName;
  String lastName;
  String fullName;
  String aboutMe;
  dynamic profliePicUrl;
  double experience;
  List<Language> languages;
  dynamic minimumCallDuration;
  double minimumCallDurationCharges;
  dynamic additionalPerMinuteCharges;
  bool isAvailable;
  double rating;
  List<Skill> skills;
  bool isOnCall;
  int freeMinutes;
  int additionalMinute;
  Images images;
  Availability availability;

  factory AstrologerData.fromJson(Map<String, dynamic> json) => AstrologerData(
        id: json["id"] ?? -1,
        urlSlug: json["urlSlug"] ?? "",
        fullName:
            "${json["firstName"] ?? ""} ${json["lastName"] ?? ""} ${addAllLanguagesToList(List<Language>.from((json["languages"] ?? []).map((x) => Language.fromJson(x))))} ${addAllSkillsToList(List<Skill>.from((json["skills"] ?? []).map((x) => Skill.fromJson(x))))}",
        namePrefix: json["namePrefix"] ?? "",
        firstName: json["firstName"] ?? "",
        lastName: json["lastName"] ?? "",
        aboutMe: json["aboutMe"] ?? "",
        profliePicUrl: json["profliePicUrl"],
        experience: json["experience"] ?? -1,
        languages: List<Language>.from(
            (json["languages"] ?? []).map((x) => Language.fromJson(x))),
        minimumCallDuration: json["minimumCallDuration"] ?? -1,
        minimumCallDurationCharges: json["minimumCallDurationCharges"] ?? -1,
        additionalPerMinuteCharges: json["additionalPerMinuteCharges"] ?? -1,
        isAvailable: json["isAvailable"] ?? false,
        rating: json["rating"] ?? 0.0,
        skills: List<Skill>.from(
            (json["skills"] ?? []).map((x) => Skill.fromJson(x))),
        isOnCall: json["isOnCall"] ?? false,
        freeMinutes: json["freeMinutes"] ?? -1,
        additionalMinute: json["additionalMinute"] ?? -1,
        images: Images.fromJson(json["images"] ?? {}),
        availability: Availability.fromJson(json["availability"] ?? {}),
      );
}

String addAllLanguagesToList(List<Language> language) {
  List<String> getAllLanguage = [];
  for (var data in language) {
    if (!getAllLanguage.contains(data.name)) {
      getAllLanguage.add(data.name);
    }
  }
  var concatenate = StringBuffer();
  for (var item in getAllLanguage) {
    concatenate.write(item + " ");
  }
  return concatenate.toString();
}

String addAllSkillsToList(List<Skill> skillList) {
  List<String> getAllSkills = [];
  for (var skill in skillList) {
    if (!getAllSkills.contains(skill.name)) {
      getAllSkills.add(skill.name);
    }
  }
  var concatenate = StringBuffer();
  for (var item in getAllSkills) {
    concatenate.write(item + " ");
  }
  return concatenate.toString();
}

class Availability {
  Availability({
    required this.days,
    required this.slot,
  });

  List<String> days;
  Slot slot;

  factory Availability.fromJson(Map<String, dynamic> json) => Availability(
        days: List<String>.from((json["days"] ?? []).map((x) => x)),
        slot: Slot.fromJson(json["slot"] ?? {}),
      );
}

class Slot {
  Slot({
    required this.toFormat,
    required this.fromFormat,
    required this.from,
    required this.to,
  });

  String toFormat;
  String fromFormat;
  String from;
  String to;

  factory Slot.fromJson(Map<String, dynamic> json) => Slot(
        toFormat: json["toFormat"] ?? "",
        fromFormat: json["fromFormat"] ?? "",
        from: json["from"] ?? "",
        to: json["to"] ?? "",
      );
}

class Images {
  Images({
    required this.small,
    required this.large,
    required this.medium,
  });

  Large small;
  Large large;
  Large medium;

  factory Images.fromJson(Map<String, dynamic> json) => Images(
        small: Large.fromJson(json["small"] ?? {}),
        large: Large.fromJson(json["large"] ?? {}),
        medium: Large.fromJson(json["medium"] ?? {}),
      );
}

class Large {
  Large({
    required this.imageUrl,
    required this.id,
  });

  String imageUrl;
  int id;

  factory Large.fromJson(Map<String, dynamic> json) => Large(
        imageUrl: json["imageUrl"] ?? "",
        id: json["id"] ?? -1,
      );
}

class Language {
  Language({
    required this.id,
    required this.name,
  });

  int id;
  String name;

  factory Language.fromJson(Map<String, dynamic> json) => Language(
        id: json["id"] ?? -1,
        name: json["name"] ?? "",
      );
}

class Skill {
  Skill({
    required this.id,
    required this.name,
    required this.description,
  });

  int id;
  String name;
  String description;

  factory Skill.fromJson(Map<String, dynamic> json) => Skill(
        id: json["id"] ?? -1,
        name: json["name"] ?? "",
        description: json["description"] ?? "",
      );
}
