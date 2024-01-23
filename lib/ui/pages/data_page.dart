import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

import '../../data/language_controll/language_controll.dart';
import '../../data/money_model/money_model.dart';

class DataPage extends StatefulWidget {
  final MoneyModel? data;

  const DataPage({Key? key, required this.data}) : super(key: key);

  @override
  _DataPageState createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  TextEditingController textEditingController = TextEditingController();
  num result = 1;
  bool isConvertingToUZS = true;//bu state almashishi uchun olingan o'zgaruvchi

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Text("hello".tr),
        actions: [
          IconButton(
              onPressed: () {
                Get.put(LocaleController()).changeLanguage(Locale("uz", "UZ"));
              },
              icon: Icon(Icons.language)),
          IconButton(
              onPressed: () {
                Get.put(LocaleController()).changeLanguage(Locale("en", "US"));
              },
              icon: Icon(Icons.language))
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              height: 40,
              width: 330,
              child: TextField(
                controller: textEditingController,
                onChanged: (value) {
                  setState(() {
                    convertCurrency(value);
                  });
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                toggleConversionMode();
              },
              child: Text(!isConvertingToUZS ? 'Convert to USD' : 'so‘mga aylantirish'),
            ),
            SizedBox(height: 20),
            Container(
              height: 50,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.blue,
              ),
              child: Center(
                child: Text(
                  NumberFormat.decimalPattern().format(result),
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  void convertCurrency(String value) {
    setState(() {
      result = (double.tryParse(value.replaceAll(',', '')) ?? 1) *
          (isConvertingToUZS ? num.parse(widget.data!.rate!) : 1 / num.parse(widget.data!.rate!));
    });
  }

  void toggleConversionMode() {
    setState(() {
      isConvertingToUZS = !isConvertingToUZS;
    });
  }
}
