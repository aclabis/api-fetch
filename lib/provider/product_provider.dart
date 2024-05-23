import 'dart:convert';

import 'package:api_fetch/model/products.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProdctApiServices extends ChangeNotifier {
  List<Products> products = [];
  ProdctApiServices(){
    fetchapiservice();
  }

  Future<void> fetchapiservice() async {
    var response = await http.get(Uri.parse("https://fakestoreapi.com/products"));
    var data = await jsonDecode(response.body);

    if (response.statusCode == 200) {
      for (Map<String, dynamic> productdata in data) {
        products.add(Products.fromJson(productdata));
      }
      notifyListeners();

    }
    print(products);
  }
}
