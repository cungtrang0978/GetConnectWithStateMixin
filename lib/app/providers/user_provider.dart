import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_connect_with_state_mixin/app/models/user_model.dart';


class UserProvider extends GetConnect {

  Future<UserModel> getUser() async {
    final response = await get("https://randomuser.me/api/?results=10");
    if (response.status.hasError) {
      return Future.error(response.statusText);
    } else {
      // final responseData = json.decode(response.body);
      final userModel = UserModel.fromJson(response.body);

      return userModel;
    }
  }
}

//get generate model on home from https://randomuser.me/api/?results=10
