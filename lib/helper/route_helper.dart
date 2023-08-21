import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:goodhere_user_v2/screen/auth/sign_up_screen.dart';

import '../screen/dashboard/dashboard_screen.dart';
import '../screen/home/home_screen.dart';
import '../screen/auth/sign_in_screen.dart';
import '../screen/auth/splash_screen.dart';
import '../screen/location/access_location_screen.dart';
import '../screen/search/search_screen.dart';

class RouteHelper {
  static const String initial = '/';
  static const String splash = '/splash';
  static const String language = '/language';
  static const String onBoarding1 = '/on-boarding-1';
  static const String onBoarding2 = '/on-boarding-2';
  static const String signIn = '/sign-in';
  static const String signUp = '/sign-up';
  static const String verification = '/verification';
  static const String accessLocation = '/access-location';
  static const String pickMap = '/pick-map';
  static const String interest = '/interest';
  static const String main = '/main';
  static const String forgotPassword = '/forgot-password';
  static const String resetPassword = '/reset-password';
  static const String search = '/search';
  static const String store = '/store';
  static const String orderDetails = '/order-details';
  static const String profile = '/profile';
  static const String updateProfile = '/update-profile';
  static const String coupon = '/coupon';
  static const String notification = '/notification';
  static const String navbar = '/navbar';
  static const String assetInfo = '/asset-info';
  static const String listInventory = '/list-inventory';
  static const String html = '/html';

  static String getInitialRoute() => '$initial';

  static String getSplashRoute() => '$splash';

  static String getLanguageRoute(String page) => '$language?page=$page';

  static String getSignInRoute() => '$signIn';

  static String getSignUpRoute() => '$signUp';

  static String getAccessInfo(String code) => '$assetInfo?code=$code';

  static String getListInventory(String id) => '$listInventory?id=$id';

  static String getHtmlRoute(String page) => '$html?page=$page';
  static String getAccessLocationRoute(String page) => '$accessLocation?page=$page';
  static String getPickMapRoute(String page, bool canRoute) => '$pickMap?page=$page&route=${canRoute.toString()}';
  static String getSearchRoute({String? queryText}) => '$search?query=${queryText ?? ''}';

  static List<GetPage> routes = [
    GetPage(name: splash, page: () => const SplashScreen()),
    GetPage(name: signIn, page: () => const SignInScreen()),
    GetPage(name: signUp, page: () => const SignUpScreen()),
    GetPage(name: main, page: () => DashboardScreen( pageIndex: 0)),
    GetPage(name: accessLocation, page: () => AccessLocationScreen(
      fromSignUp: Get.parameters['page'] == signUp, fromHome: Get.parameters['page'] == 'home', route: "",
    )),
    GetPage(name: search, page: () => getRoute(SearchScreen(queryText: Get.parameters['query']!))),

  ];

  static getRoute(Widget navigateTo) {
    // int _minimumVersion = 0;
    // if (GetPlatform.isAndroid) {
    //   _minimumVersion =
    //       Get.find<SplashController>().configModel.appMinimumVersionAndroid;
    // } else if (GetPlatform.isIOS) {
    //   _minimumVersion =
    //       Get.find<SplashController>().configModel.appMinimumVersionIos;
    // }
    // return AppConstants.APP_VERSION < _minimumVersion
    //     ? UpdateScreen(isUpdate: true)
    //     : Get.find<SplashController>().configModel.maintenanceMode
    //         ? UpdateScreen(isUpdate: false)
    //         : Get.find<LocationController>().getUserAddress() == null
    //             ? AccessLocationScreen(
    //                 fromSignUp: false, fromHome: false, route: Get.currentRoute)
    //             :


    return navigateTo;
  }
}
