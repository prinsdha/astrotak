import 'package:astrotak/ui/screen/Tab-2/widget/filter_screen.dart';
import 'package:astrotak/ui/screen/base_screen/base_screen.dart';
import 'package:get/get.dart';

final List<GetPage<dynamic>> routes = [
  GetPage(name: BaseScreen.routeName, page: () => const BaseScreen()),
  GetPage(name: FilterScreen.routeName, page: () => const FilterScreen()),
];
