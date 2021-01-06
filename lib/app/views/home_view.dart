import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_connect_with_state_mixin/app/controllers/home_controller.dart';
import 'dart:ui';

class HomeView extends GetView<HomeController> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();

  Future<Null> _refresh() {
    return controller.fetchUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User List'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: controller.fetchUser,
          ),
        ],
      ),
      body: controller.obx(
        (userModel) {
          final results = userModel.results;
          return RefreshIndicator(
            key: _refreshIndicatorKey,
            child: ListView.builder(
                padding: EdgeInsets.all(8),
                itemCount: results.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          leading: CircleAvatar(
                            radius: 30,
                            backgroundImage:
                                NetworkImage(results[index].picture.large),
                          ),
                          title: Text(
                            results[index].name.title +
                                " " +
                                results[index].name.first +
                                " " +
                                results[index].name.last,
                          ),
                          subtitle: Text(
                            results[index].email,
                            style: TextStyle(fontSize: 12),
                          ),
                          trailing: Text(
                            "Age : " + results[index].dob.age.toString(),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
            onRefresh: _refresh,
          );
        },
        onError: (error) => Center(
          child: Text(error),
        ),
      ),
    );
  }
}
