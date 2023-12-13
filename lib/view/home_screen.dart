import 'package:casa_vertical_stepper/casa_vertical_stepper.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:webcom_task/utils/app_strings.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utils/app_colors.dart';
import '../viewmodel/home_view_model.dart';

class HomeScreen extends GetView<HomeViewModel> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: AppBar(
            centerTitle: true,
              title: Text(AppStrings.sendMoney,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700)),
              backgroundColor: AppColors.primaryColor),
          body: controller.isLoading.isFalse
              ? SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            height: 100,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextField(
                                      controller: controller.edtSend.value,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.always,
                                        hintText: 'You send',
                                      ),
                                      keyboardType: TextInputType.number,
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    controller.showCurrencyPic();
                                  },
                                  child: Container(
                                    height: 150,
                                    width: 150,

                                    decoration: BoxDecoration(
                                        color: Colors.blue.shade50),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                            height: 20,
                                            width: 30,
                                            child: Image.asset('assets/images/flag.png',)),
                                        Text(
                                          controller.cur.value
                                        ),
                                        Icon(
                                          Icons.keyboard_arrow_down
                                        )

                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          CasaVerticalStepperView(
                            steps: controller.stepperList.value,
                            seperatorColor: const Color(0xffD2D5DF),
                            isExpandable: false,
                            showStepStatusWidget: false,
                          ),
                          Container(
                            height: 100,

                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextField(
                                      controller: controller.edtReceive.value,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.always,
                                        hintText: 'Receipient Receive',
                                      ),
                                      keyboardType: TextInputType.number,
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    controller.showCurrencyPic();
                                  },
                                  child: Container(
                                    height: 150,
                                    width: 150,

                                    decoration: BoxDecoration(
                                        color: Colors.blue.shade50),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                            height: 20,
                                            width: 30,
                                            child: Image.asset('assets/images/flag.png',)),
                                        Text(
                                            controller.cur.value
                                        ),
                                        Icon(
                                            Icons.keyboard_arrow_down
                                        )

                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                  text: AppStrings.byCont),
                              TextSpan(
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red),
                                  text: 'Terms of use',
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () async {
                                      var url = "uxw?view_as=subscriber";
                                      if (await canLaunch(url)) {
                                        await launch(url);
                                      } else {
                                        throw 'Could not launch $url';
                                      }
                                    }),
                              TextSpan(
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                  text: 'and'),
                              TextSpan(
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red),
                                  text: 'Privacy Policy',
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () async {
                                      var url = "uxw?view_as=subscriber";
                                      if (await canLaunch(url)) {
                                        await launch(url);
                                      } else {
                                        throw 'Could not launch $url';
                                      }
                                    }),
                            ]),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              child: Text('CONTINUE'),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.red,
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              : Container(
                  child: Center(child: CircularProgressIndicator()),
                ),
          bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Colors.white,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              selectedFontSize: 14,
              unselectedFontSize: 14,
              unselectedItemColor: Colors.red,
              unselectedLabelStyle: TextStyle(color: Colors.red),
              selectedLabelStyle: TextStyle(color: Colors.red),
              selectedIconTheme: IconThemeData(size: 34, color: Colors.black),
              unselectedIconTheme: IconThemeData(size: 34, color: Colors.black),
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: AppStrings.activity,
                    backgroundColor: Colors.white),
                BottomNavigationBarItem(
                    icon: Icon(Icons.search),
                    label: AppStrings.account,
                    backgroundColor: Colors.white),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: AppStrings.send,
                  backgroundColor: Colors.white,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: AppStrings.receipients,
                  backgroundColor: Colors.white,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: AppStrings.support,
                  backgroundColor: Colors.white,
                ),
              ],
              type: BottomNavigationBarType.shifting,
              currentIndex: 0,
              selectedItemColor: Colors.black,
              iconSize: 40,
              onTap: controller.onItemTapped,
              elevation: 5),
        ));
  }
}
