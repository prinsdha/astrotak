import 'package:astrotak/ui/screen/Tab-1/home_screen.dart';
import 'package:astrotak/ui/screen/Tab-1/model/navigation_model.dart';
import 'package:astrotak/ui/screen/Tab-2/talk_to_atrologer.dart';
import 'package:flutter/cupertino.dart';

import 'core/constant/app_icons.dart';
import 'ui/screen/base_screen/base_screen.dart';

const String getInitialRoute = BaseScreen.routeName;
final List<NavigationTabContainModel> navigationTabList = [
  NavigationTabContainModel(icon: AppIcons.home, name: "Home"),
  NavigationTabContainModel(icon: AppIcons.talk, name: "Talk to Astrologer"),
  NavigationTabContainModel(icon: AppIcons.ask, name: "Ask Question"),
  NavigationTabContainModel(icon: AppIcons.reports, name: "Reports"),
  NavigationTabContainModel(icon: AppIcons.chat, name: "Chat with Astrologer"),
];
List<Widget> navigationScreens = const [
  HomeScreen(),
  TalkToAstrologer(),
  DummyPage(),
  DummyPage(),
  DummyPage(),
];

class DummyPage extends StatelessWidget {
  const DummyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
