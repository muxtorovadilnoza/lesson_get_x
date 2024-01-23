import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../data/money_controllor/money_controllor.dart';
import 'package:dio/dio.dart';

import '../../data/network_servis/network_servis.dart';
import 'data_page.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key});

  MoneyController moneyController = Get.put(MoneyController(Networkservis(Dio())))..getPosts();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: InkWell(
          child: Obx(() => Text(DateFormat("yyyy-MM-dd").format(moneyController.dateTime.value))),
          onTap: () {
            showDatePicker(
              context: context,
              initialDate: moneyController.dateTime.value,
              firstDate: DateTime(2018),
              lastDate: DateTime.now(),
            ).then((value) {
              if (value != null) {
                moneyController.changeDateTime(value);
                moneyController.getPosts();
              }
            });
          },
        )

      ),
      body: Obx(() => getBody()),
    );
  }

  Widget getBody() {
    if (moneyController.isLoading.value) {
      return const CircularProgressIndicator();
    } else {
      return ListView.builder(
        itemBuilder: (context, index) => TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DataPage(data: moneyController.posts[index]),
              ),
            );
          },
          child: Row(
            children: [
              Text(moneyController.posts[index].ccyNmUZ ?? ""),SizedBox(width: 20,),
              Text(moneyController.posts[index].rate ?? ""),
            ],
          ),
        ),
        itemCount: moneyController.posts.length,
      );
    }
  }
}
