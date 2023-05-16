import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:iug_local_storage/mvc/models/get_products_Response.dart';

class ApiHelper {
  ApiHelper._();
  static ApiHelper apiHelper = ApiHelper._();
  late Dio dio;
  initApi() {
    dio = Dio();
  }

  Future<List<OneProductResponse>?> getAllProducts() async {
    try {
      Response response = await dio.get('https://fakestoreapi.com/products');
      List data = response.data;
      List<OneProductResponse> products =
          data.map((e) => OneProductResponse.fromJson(e)).toList();
      log(products.length.toString());
      return products;
    } on Exception catch (e) {
      // TODO
    }
  }
}
