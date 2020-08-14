import 'package:flutter/material.dart';
import '../models/product.dart';
import '../data/dummy_data.dart';

class Products with ChangeNotifier {
  List<Product> _items = DUMMY_PRODUCTS;

  //retorna uma copia 
  List<Product> get items => [ ..._items ];

  // retorna a referencia (a variavel propriamente dita)
  // List<Product> get items => _items;

  void addProduct(Product product) {
    _items.add(product);
    // chamado sempre que for feita uma mudança importante, para notificar os componentes interessados
    notifyListeners();
  }
}