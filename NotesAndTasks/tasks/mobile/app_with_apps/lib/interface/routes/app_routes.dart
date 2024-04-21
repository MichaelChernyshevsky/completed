import 'package:app_with_apps/constants/exports/exports.dart';
import 'package:app_with_apps/interface/screens/main_page.dart';
import 'package:app_with_apps/interface/screens/start/splash_screen.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';
  static const String mainPage = '/apps_screen';

  static Map<String, WidgetBuilder> get routes => {
        splashScreen: (_) => const SplashScreen(),
        mainPage: (_) => const MainPage(),
      };
}
