import 'dart:math';

import 'package:flutter/cupertino.dart';

import './cart.dart';

class Order {
  final String id;
  final double total;
  final List<CartItem> products;
  final DateTime date;

  Order({
    this.id,
    this.total,
    this.products,
    this.date,
  });
}

class Orders with ChangeNotifier {
  List<Order> _orders = [];

  List<Order> get orders {
    return [..._orders];
  }

  void addOrder(List<CartItem> products, double total) {
    // final combine = (t, i) => t + (i.price * i.quantity);
    // final total = products.fold(0.0, combine);

    _orders.insert(0, Order(
      id: Random().nextDouble().toString(),
      total: total,
      date: DateTime.now(),
      products: products
    ));

    notifyListeners();
  }
}