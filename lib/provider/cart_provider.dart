import 'package:flutter/material.dart';
import 'package:urban_eats/models/products.dart';

class CartProvider with ChangeNotifier {
  final List<MyProductModel> _cartItems = [];
  List<MyProductModel> get cartItems => _cartItems;

  void addToCat(MyProductModel product) {
    _cartItems.add(product);
    notifyListeners();
  }

  void removeFromCat(MyProductModel product) {
    _cartItems.remove(product);
    notifyListeners();
  }

  int get cartCount => _cartItems.length;
}
