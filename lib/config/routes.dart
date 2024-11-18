import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:zippopotamus/modules/home/presentation/bindings/home_view_binding.dart';
import 'package:zippopotamus/modules/home/presentation/views/home_view.dart';
import 'package:zippopotamus/modules/splash/presentation/bindings/splash_binding.dart';
import 'package:zippopotamus/modules/splash/presentation/views/splash_view.dart';

class Routes {
  static const String splashView = '/';
  static const String homeView = '/home-view';
  static List<GetPage> routes = [
    GetPage(
      name: '/$homeView',
      page: () => const HomeView(),
      binding: HomeViewBinding(),
    ),
    GetPage(
      name: '/$splashView',
      page: () => const SplashView(),
      binding: SplashViewBinding(),
    ),
  ];
}
