

import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';

import '../money_model/money_model.dart';
part 'network_servis.g.dart';

@RestApi(baseUrl: 'https://cbu.uz/')
abstract class Networkservis {
  factory Networkservis(Dio dio, { String baseUrl})=_Networkservis;

  @GET('uz/arkhiv-kursov-valyut/json/all/{date}/')
  Future<List<MoneyModel>?> allNews(
      @Path() String date,
      );

}