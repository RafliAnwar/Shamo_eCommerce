import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shamo_ecommerce/model/product_model.dart';
import 'package:shamo_ecommerce/services/product_service.dart';

class ProductProvider with ChangeNotifier {
  List<ProductModel> _products = [];
  List<ProductModel> get products => _products;

  set products(List<ProductModel> products) {
    _products = products;
    notifyListeners();
  }

  Future<void> getProducts() async {
    try {
      List<ProductModel> products = await ProductService().getProducts();
      _products = products;
    } catch (e) {
      print(e);
    }
  }
}
