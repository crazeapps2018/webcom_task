import 'package:casa_vertical_stepper/casa_vertical_stepper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webcom_task/utils/app_strings.dart';
import 'package:currency_picker/currency_picker.dart';

import '../base/base_controller.dart';

class HomeViewModel extends BaseController {

  final isLoading = true.obs;
  final stepperList = <StepperStep>[].obs;

  final _selectedIndex = 0.obs;
  static const List<Widget> widgetOptions = <Widget>[
    Text(AppStrings.activity, style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text(AppStrings.account, style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text(AppStrings.send, style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text(AppStrings.receipients, style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text(AppStrings.support, style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),

  ];

  final edtSend = TextEditingController().obs;
  final edtReceive = TextEditingController().obs;

  var flag = "".obs;
  var cur = "AUD".obs;

  @override
  void onInit() {
    super.onInit();

    initData();

  }

   submit(){
    if(edtSend.value.text.isEmpty){
      print("Please enter send value");
    }else if(edtSend.value.text.isEmpty){
      print("Please enter receive value");
    }
    else {
      //Submit api
    }
  }

  showCurrencyPic(){
    showCurrencyPicker(
      context: Get.context!,
      showFlag: true,
      showCurrencyName: true,
      showCurrencyCode: true,
      onSelect: (Currency currency) {
         flag.value = currency.flag!;
         cur.value = currency.name;
        print('Select currency: ${currency.name}');
      },
    );
  }


  void onItemTapped(int index) {
      _selectedIndex.value = index;
  }

  initData(){
     stepperList.value = [
      StepperStep(
        title: Text('5 AUD'),
        view:Text(AppStrings.totalFee),
      ),
      StepperStep(
        title: Text(''),
        view:Text(AppStrings.amountWill),
      ),
       StepperStep(
         title: Text(''),
         view:Text(AppStrings.conRate),
       ),
    ];

    isLoading.value = false;
  }
}