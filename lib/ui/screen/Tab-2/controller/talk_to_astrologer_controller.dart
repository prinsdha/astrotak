import 'package:astrotak/core/service/repo/almanac_repo.dart';
import 'package:astrotak/core/utils/app_functions.dart';
import 'package:astrotak/ui/screen/Tab-2/model/all_astrologer_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class TalkToAstrologerController extends GetxController {
  List<AstrologerData> astrologerData = [];

  List<AstrologerData> astrologerDataDup = [];

  Future fetchAllAgents() async {
    final response = await AlmanacRepo.getAllAstrologers();
    if (response != null) {
      isSearchOn = false;
      searchText.clear();
      appliedFilters.clear();
      for (var element in allFilters) {
        appliedFilters.putIfAbsent(element, () => []);
      }
      selectedSort = null;
      astrologerData = response.data;
      astrologerDataDup = astrologerData;
      addAllSkillsToList();
      addAllLanguagesToList();
      update();
    }
  }

  bool _isSearchOn = false;

  bool get isSearchOn => _isSearchOn;

  set isSearchOn(bool value) {
    _isSearchOn = value;
    update();
  }

  String getSkills(AstrologerData astrologerData) {
    List<String> skillName = [];
    skillName.addAll(astrologerData.skills.map((e) => e.name));
    return skillName.toString().split("[")[1].split("]")[0];
  }

  final TextEditingController searchText = TextEditingController();
  List<String> getAllSkills = [];
  void addAllSkillsToList() {
    getAllSkills.clear();
    for (var data in astrologerData) {
      for (var skill in data.skills) {
        if (!getAllSkills.contains(skill.name)) {
          getAllSkills.add(skill.name);
        }
      }
    }
  }

  List<String> getAllLanguage = [];
  void addAllLanguagesToList() {
    getAllLanguage.clear();
    for (var data in astrologerData) {
      for (var language in data.languages) {
        if (!getAllLanguage.contains(language.name)) {
          getAllLanguage.add(language.name);
        }
      }
    }
  }

  List<String>? get getCurrentFilterList {
    switch (selectedFilterSection) {
      case "Language":
        return getAllLanguage;
      case "Skills":
        return getAllSkills;
    }
  }

  List<String> allFilters = ["Language", "Skills"];
  Map<String, List<String>> appliedFilters = {};
  void resetFilter() {
    appliedFilters.clear();
    selectedFilterSection = allFilters[0];
    for (var element in allFilters) {
      appliedFilters.putIfAbsent(element, () => []);
    }
    astrologerDataDup = astrologerData;
    update();
  }

  String _selectedFilterSection = "Language";

  String get selectedFilterSection => _selectedFilterSection;

  set selectedFilterSection(String value) {
    _selectedFilterSection = value;
    update();
  }

  List<AstrologerData> get searchAstrologer {
    if (searchText.text.isNotEmpty && searchText.text.length > 1) {
      return astrologerData
          .where((element) => element.fullName
              .toLowerCase()
              .contains(searchText.text.toLowerCase()))
          .toList();
    } else {
      return astrologerDataDup;
    }
  }

  List<AstrologerData> get filterThroughSkill {
    List<AstrologerData> skillData = [];
    if (appliedFilters["Skills"]!.isNotEmpty) {
      bool isBreak = false;
      for (var element in astrologerData) {
        isBreak = false;
        for (var appliedFilter in appliedFilters["Skills"]!) {
          for (var skill in element.skills) {
            if (skill.name == appliedFilter) {
              if (!skillData.contains(element)) {
                skillData.add(element);
                isBreak = true;
                break;
              }
            }
          }
          if (isBreak) {
            break;
          }
        }
      }
      return filterOfLanguage(skillData);
    } else {
      return filterOfLanguage(astrologerDataDup);
    }
  }

  List<AstrologerData> filterOfLanguage(List<AstrologerData> data) {
    List<AstrologerData> languageData = [];
    if (appliedFilters["Language"]!.isNotEmpty) {
      bool isBreak = false;
      for (var element in data) {
        isBreak = false;
        for (var appliedFilter in appliedFilters["Language"]!) {
          for (var languages in element.languages) {
            if (languages.name == appliedFilter) {
              if (!languageData.contains(element)) {
                languageData.add(element);
                isBreak = true;
                break;
              }
            }
          }
          if (isBreak) {
            break;
          }
        }
      }
      return languageData;
    } else {
      return data;
    }
  }

  void clearSearch() {
    searchText.clear();
    disposeKeyboard();
    isSearchOn = false;
  }

  List<AstrologerData> get astrologerSortList {
    if (selectedSort != null) {
      if (sortList[0] == selectedSort) {
        astrologerDataDup.sort((a, b) => b.experience.compareTo(a.experience));
      } else if (sortList[1] == selectedSort) {
        astrologerDataDup.sort((a, b) => a.experience.compareTo(b.experience));
      } else if (sortList[2] == selectedSort) {
        astrologerDataDup.sort((a, b) => b.minimumCallDurationCharges
            .compareTo(a.minimumCallDurationCharges));
      } else if (sortList[3] == selectedSort) {
        astrologerDataDup.sort((a, b) => a.minimumCallDurationCharges
            .compareTo(b.minimumCallDurationCharges));
      }
      return astrologerDataDup;
    }
    return astrologerDataDup;
  }

  String? _selectedSort;

  String? get selectedSort => _selectedSort;

  set selectedSort(String? value) {
    _selectedSort = value;
    update();
  }

  List<String> sortList = [
    "Experience- high to low",
    "Experience- low to high",
    "Price- high to low",
    "Price- low to high",
  ];

  String getLanguages(AstrologerData astrologerData) {
    return astrologerData.languages
        .map((e) => e.name)
        .toString()
        .split("(")[1]
        .split(")")[0];
  }

  @override
  void onInit() {
    fetchAllAgents();

    super.onInit();
  }
}
