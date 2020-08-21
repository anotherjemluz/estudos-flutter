import 'package:flutter/material.dart';
import 'product.dart';
import '../data/dummy_data.dart';

class Products with ChangeNotifier {
  List<Product> _items = DUMMY_PRODUCTS;

  //retorna uma copia 
  List<Product> get items => [ ..._items ];

  List<Product> get favoriteItems {
    return _items.where((product) => product.isFavorite).toList();
  }
  
  // retorna a referencia (a variavel propriamente dita)
  // List<Product> get items => _items;

  void addProduct(Product product) {
    _items.add(product);
    notifyListeners(); // chamado sempre que for feita uma mudança importante, para notificar os componentes interessados
  }

  // -----------------------------------
  // SHOW ALL OR FAVORITES GLOBAL CONTROL

  // bool _showFavoriteOnly = false;


  // List<Product> get items {
  //   if(_showFavoriteOnly) {
  //     return _items.where((product) => product.isFavorite).toList();
  //   }
  //   return [ ..._items ];
  // }

  // void showFavoriteOnly() {
  //   _showFavoriteOnly = true;
  //   notifyListeners();
  // }

  // void showAll() {
  //   _showFavoriteOnly = false;
  //   notifyListeners();
  // }
}