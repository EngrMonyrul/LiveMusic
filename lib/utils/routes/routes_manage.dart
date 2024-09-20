import 'package:flutter/material.dart';
import 'package:live_score/common/widgets/error_page.dart';
import 'package:live_score/utils/routes/routes_name.dart';
import 'package:live_score/views/home/screen/home_screen.dart';
import 'package:live_score/views/splash/screen/splash_screen.dart';

class RoutesManage {
  RoutesManage._();

  static Map<String, WidgetBuilder> routes({Object? args}) => {
        RoutesName.homeScreen: (context) => const HomeScreen(),
        RoutesName.splashScreen: (context) => const SplashScreen(),
      };

  static Route<dynamic> onGenerateRoutes(RouteSettings routeSettings) {
    final builder = routes(args: routeSettings.arguments)[routeSettings.name];

    if (builder != null) {
      return MaterialPageRoute(
        builder: (context) => builder(context),
      );
    } else {
      return MaterialPageRoute(
        builder: (context) => ErrorPage(
          errorWidget:
              Text("No Page Found Named ${routeSettings.name ?? "\"Empty\""}"),
        ),
      );
    }
  }
}
