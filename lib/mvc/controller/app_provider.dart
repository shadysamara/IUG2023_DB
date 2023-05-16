import 'package:flutter/material.dart';
import 'package:iug_local_storage/mvc/models/api_helper.dart';
import 'package:iug_local_storage/mvc/models/get_products_Response.dart';

class AppProvider extends ChangeNotifier {
  AppProvider() {
    getAllProducts();
  }
  List<OneProductResponse>? products;
  getAllProducts() async {
    products = await ApiHelper.apiHelper.getAllProducts();
    notifyListeners();
  }
}
