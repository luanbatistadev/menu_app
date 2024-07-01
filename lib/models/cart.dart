import 'package:flutter/material.dart';
import 'package:menu_app/models/foods.dart';

class Cart extends ChangeNotifier {
  Map<Food, int> userCart = {};

  Map<Food, int> getUserCart() {
    return userCart;
  }

  void addItemToCart(Food food) {
    if (userCart.containsKey(food)) {
      userCart[food] = userCart[food]! + 1;
    } else {
      userCart[food] = 1;
    }
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

  double getTotalPrice() {
    double totalPrice = 0.0;
    userCart.forEach((food, quantity) {
      totalPrice += food.price * quantity;
    });
    return totalPrice;
  }

  int getCartLength() {
    return getUserCart().length;
  }
}
