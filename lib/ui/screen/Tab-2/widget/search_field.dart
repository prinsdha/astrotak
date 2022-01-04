import 'package:astrotak/core/constant/app_color.dart';
import 'package:astrotak/core/constant/app_settings.dart';
import 'package:astrotak/core/utils/config.dart';
import 'package:astrotak/ui/screen/Tab-2/controller/talk_to_astrologer_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchField extends StatelessWidget {
  const SearchField({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (TalkToAstrologerController talkToAstrologerController) =>
          talkToAstrologerController.isSearchOn
              ? Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: kDefaultPadding)
                          .copyWith(bottom: 10, top: 5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(7),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.20),
                            offset: const Offset(0, 2),
                            blurRadius: 5)
                      ]),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.search,
                          size: 19,
                          color: AppColor.kPrimaryColor,
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          controller: talkToAstrologerController.searchText,
                          style: TextStyle(
                              fontSize: getWidth(12),
                              color: AppColor.kPrimaryColor),
                          cursorColor: AppColor.kPrimaryColor,
                          onChanged: (val) {
                            talkToAstrologerController.searchAstrologer;
                            talkToAstrologerController.update();
                          },
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              hintText: "Search Astrologer",
                              hintStyle: TextStyle(fontSize: getWidth(12))),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          talkToAstrologerController.clearSearch();
                        },
                        icon: const Icon(
                          Icons.close,
                          size: 19,
                          color: AppColor.kPrimaryColor,
                        ),
                      )
                    ],
                  ),
                )
              : const SizedBox(),
    );
  }
}
