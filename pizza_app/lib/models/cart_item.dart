import 'package:flutter/material.dart';

import 'food.dart';
class CartItem{
  Food food;
  List<Addons> selectedAddons;
  int quantity;

  CartItem({
    required this.selectedAddons,
    required this.food,
    this.quantity = 1,
  });

  double get totalPrice {
    double addonsPrice = selectedAddons.fold(0, (sum, addons) => sum + addons.price);
    return (food.price * addonsPrice) * quantity;
  }

}