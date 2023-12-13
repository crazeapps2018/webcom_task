
import 'package:flutter/animation.dart';

import '../view/bindings/home_binding.dart';
import '../view/home_screen.dart';
import 'app_routes.dart';
import 'package:get/get.dart';


class AppPages {

  static var list = [
    GetPage(
      name : AppRoutes.homeScreen,
      page: () => HomeScreen(),
      binding: HomeBinding(),
      curve: Curves.easeInOutQuart,
      transition: Transition.native,
      transitionDuration: const Duration(milliseconds: 500),
    )
  ];
}