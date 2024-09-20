import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:live_score/utils/routes/routes_manage.dart';
import 'package:live_score/utils/routes/routes_name.dart';
import 'package:live_score/utils/themes/base_theme_config.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1080, 2400),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "LiveScore",
          theme: BaseThemeConfig.lightThemeConfig,
          onGenerateRoute: RoutesManage.onGenerateRoutes,
          initialRoute: RoutesName.splashScreen,
        );
      },
    );
  }
}
