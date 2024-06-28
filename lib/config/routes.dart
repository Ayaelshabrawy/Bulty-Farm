import 'package:bulty_farmm/cart/cart_screen.dart';
import 'package:bulty_farmm/features/authentication/views/login/login_view.dart';
import 'package:bulty_farmm/login_signup.dart';
import 'package:get/get.dart';
import '../Owner/Home/Homepage.dart';
import '../features/authentication/bindings/auth_bindings.dart';
import '../features/authentication/views/authentication_view.dart';
import '../features/authentication/views/signup/signup_view.dart';
import '../splachscreen.dart';
import 'package:bulty_farmm/cart/cart.dart';
import 'package:bulty_farmm/payment/payment_screen.dart';
import 'package:bulty_farmm/Customer/customer_market/onboarding_screen.dart';
class AppRoutes {
  static const String home = '/home';
  static const String ownerDashboard = '/dashboard';
  static const String profileView = '/profile';
  static const String splashScreen = '/splash';
  static const String authScreen = '/auth';
  static const String login = '/login';
  static const String signUp = '/signUp'; // Sign up
  static const String onboarding = '/onboarding';
  static const String cart = '/cart';
  static const payment= '/payment';



  static List<GetPage> pages = [
    GetPage(
      name: splashScreen,
      page: () => const SplashScreen(),
      bindings: [
        // SplashBinding(),
      ],
    ),

    GetPage(
      name: login,
      page: () => const LoginView(),
      bindings: [
        AuthBindings(),
      ],
    ),
    GetPage(
      name: signUp,
      page: () => const SignUpView(),
      bindings: [
        AuthBindings(),
      ],
    ),

    GetPage(
      name: authScreen,
      page: () => const AuthenticationView(),
      bindings: [
        AuthBindings(),
        ],

    ),

// Get.toNamed(onboarding);
    GetPage(
      name: onboarding,
      page: () => const OnBoardingScreen(),
      // bindings: [
      //
      // ],
    ),
    GetPage(
      name: home,
      page: () => HomePage(),
      bindings: [
        // HomeBinding(),
      ],
    ),
    // GetPage(name:cart,
    //     page:() => CartScreen()
    // ),
    //







    //   GetPage(
    //   name: ownerDashboard,
    //   page: () => const AdmindashboardScreen(),
    //   bindings: [
    //     AdmindashboardBinding(),
    //   ],
    // ),
  ];
}
