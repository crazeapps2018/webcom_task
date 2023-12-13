import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:webcom_task/routes/app_pages.dart';
import 'package:webcom_task/routes/app_routes.dart';
import 'package:webcom_task/utils/app_strings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}): super(key: key);

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: AppRoutes.homeScreen,
      getPages: AppPages.list,
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
    );
  }
}
