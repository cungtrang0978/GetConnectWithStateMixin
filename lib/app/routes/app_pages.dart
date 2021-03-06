import 'package:get/get.dart';
import 'package:get_connect_with_state_mixin/app/bindings/home_binding.dart';
import 'package:get_connect_with_state_mixin/app/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
  ];
}
