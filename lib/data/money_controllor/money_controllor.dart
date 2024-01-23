import 'package:get/get.dart';
import 'package:intl/intl.dart';


import '../money_model/money_model.dart';
import '../network_servis/network_servis.dart';

class MoneyController extends GetxController {
  final Networkservis networkservis;

  var _posts = <MoneyModel>[].obs;
  var _isLoading = false.obs;
 var _dateTime = DateTime.now().obs;

  changeDateTime(DateTime dateTime) {
    print('Changing date to $dateTime');
    _dateTime.value = dateTime;
    getPosts();
  }

  Rx<DateTime> get dateTime => _dateTime;
  RxList<MoneyModel> get posts => _posts;
  RxBool get isLoading => _isLoading;

  getPosts() async {
    isLoading.value = true;
    var response = await networkservis.allNews(DateFormat("yyyy-MM-dd").format(_dateTime.value));
    if (response != null) {
      _posts = <MoneyModel>[].obs;
      _posts.addAll(response);
    }
    isLoading.value = false;
  }


  MoneyController(this.networkservis);
}
