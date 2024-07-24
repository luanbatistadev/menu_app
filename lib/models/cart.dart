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
    return userCart.entries
        .fold(0.0, (total, entry) => total + entry.key.price * entry.value);
  }

  int getCartLength() {
    return userCart.values.fold(0, (total, quantity) => total + quantity);
  }
}

class ShoppingCart {
  factory ShoppingCart.fromJson(String source) =>
      ShoppingCart.fromMap(json.decode(source) as Map<String, dynamic>);

  factory ShoppingCart.fromMap(Map<String, dynamic> map) {
    return ShoppingCart(
      userCart: Map<Food, int>.from(
        (map['userCart'] as Map<Food, int>),
      ),
    );
  }
  ShoppingCart({required this.userCart});

  @HiveField(0)
  final Map<Food, int> userCart;

  Map<String, dynamic> convertCartToMap() {
    Map<String, dynamic> cartMap = {};
    userCart.forEach((food, quantity) {
      cartMap[food.toMap().toString()] = quantity;
    });
    return cartMap;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userCart': userCart,
    };
  }

  String toJson() => json.encode(toMap());
}
