import 'package:get/get.dart';
import 'package:get_connect_with_state_mixin/app/models/user_model.dart';
import 'package:get_connect_with_state_mixin/app/providers/user_provider.dart';


class HomeController extends GetxController with StateMixin<UserModel> {
  @override
  void onInit() {
    super.onInit();
   fetchUser();
  }

  fetchUser() => UserProvider().getUser().then((response) {
        change(response, status: RxStatus.success());
      }, onError: (err) {
        change(
          null,
          status: RxStatus.error(err.toString()),
        );
      });
}
