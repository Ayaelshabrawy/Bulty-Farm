import 'package:get/get.dart';

import '../Owner/Home/Homepage.dart';
import '../splachscreen.dart';

class AppRoutes {
  static const String homeScreen = '/home';
  static const String ownerDashboard = '/dashboard';
  static const String profileView = '/profile';

  static const String splashScreen = '/splash';

  /// pages
  static List<GetPage> pages = [
    GetPage(
      name: homeScreen,
      page: () => HomePage(),
      bindings: [
        // HomeBinding(),
      ],
    ),

    GetPage(
      name: splashScreen,
      page: () => const SplashScreen(),
      bindings: [
        // SplashBinding(),
      ],
    ),

    //   GetPage(
    //   name: ownerDashboard,
    //   page: () => const AdmindashboardScreen(),
    //   bindings: [
    //     AdmindashboardBinding(),
    //   ],
    // ),
  ];
}
