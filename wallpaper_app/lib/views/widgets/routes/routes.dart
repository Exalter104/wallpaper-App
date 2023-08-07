import 'package:get/get.dart';
import 'package:wallpaper_app/views/screens/home.dart';

import 'routes_name.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
          name: RoutesName.homeScreen,
          page: () => const HomeScreen(),
        ),
      ];
}
