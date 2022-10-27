import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/api/dio_helper.dart';
import 'core/services/service_locator.dart';
import 'getStarted/presentation/screens/splash_screen/splsh_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  ServiceLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(415, 898),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, widget) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Tatware',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
