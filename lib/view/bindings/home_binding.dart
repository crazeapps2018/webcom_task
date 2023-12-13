
import 'package:get/get.dart';
import 'package:webcom_task/viewmodel/home_view_model.dart';

class HomeBinding extends Bindings {


  @override
  void dependencies() {
    Get.lazyPut(() => HomeViewModel());
  }}