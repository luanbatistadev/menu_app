import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:menu_app/models/foods.dart';

class Cart extends ChangeNotifier {
  Map<Food, int> userCart = {};

  Map<Food, int> getUserCart() {
    return userCart;
  }

  Map<String, dynamic> convertCartToMap() {
    Map<String, dynamic> cartMap = {};
    userCart.forEach((food, quantity) {
      cartMap[food.toMap().toString()] = quantity;
    });
    return cartMap;
  }

  Future<void> addItemToCart(Food food) async {
    if (userCart.containsKey(food)) {
      userCart[food] = userCart[food]! + 1;
    } else {
      userCart[food] = 1;
    }
    final box = await Hive.openBox('cartBox');
    box.put('userCart', convertCartToMap());
    notifyListeners();
  }

  void removeItemFromCart(Food food) {
    if (userCart.containsKey(food) && userCart[food]! > 1) {
      userCart[food] = userCart[food]! - 1;
    } else {
      userCart.remove(food);
    }
    notifyListeners();
  }

  bool hasItemInCart(Food food) {
    return userCart.containsKey(food);
  }

  double getTotalPrice() {
    return userCart.entries.fold(0.0, (total, entry) => total + entry.key.price * entry.value);
  }

  int getCartLength() {
    return userCart.values.fold(0, (total, quantity) => total + quantity);
  }
}

class ShoppingCart {
  factory ShoppingCart.fromMap(Map<Map<String, dynamic>, dynamic> map) {
    final newUserCart = <Food, int>{};
    map.forEach((key, value) {
      Food food = Food.fromMap(key);
      int quantity = value;
      newUserCart[food] = quantity;
    });
    return ShoppingCart(
      userCart: newUserCart,
    );
  }
  ShoppingCart({required this.userCart});

  final Map<Food, int> userCart;

  Map<Map<String, dynamic>, dynamic> toMap() {
    Map<Map<String, dynamic>, dynamic> userCartMap = {};
    userCart.forEach((food, quantity) {
      userCartMap[food.toMap()] = quantity;
    });
    return userCartMap;
  }

  String toJson() => json.encode(toMap());
}
