import 'package:flutter/material.dart';

import './categories_screen.dart';
import './favorite_screen.dart';
import '../components/main_drawer.dart';

class TabsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2 ,
      // initialIndex: 1,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Vamos cozinhar'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.category),
                text: 'Categorias',
              ),
              Tab(
                icon: Icon(Icons.favorite),
                text: 'Favoritos',
              )
            ],
          ),
        ),
        drawer: MainDrawer(),
        body: TabBarView(
          children: <Widget>[
            CategoriesScreen(),
            FavoriteScreen(),
          ],
        )
      ),
    );
  }
}