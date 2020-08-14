import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './config/app_routes.dart';
import './providers/products.dart';
import './views/products_overview_screen.dart';
import './views/product_detail_screen.dart';

// roda o app
void main() => runApp(LojaApp());

// app
class LojaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // retorna um widget(component)
    return ChangeNotifierProvider(
      create: (_) => new Products(),
      child: MaterialApp(
        title: 'Minha loja',

        // olha aqui outro componente
        theme: ThemeData(
          // mais componente
          primarySwatch: Colors.purple,
          accentColor: Colors.deepOrange,
          fontFamily: 'Lato',
        ),

        // essa eh uma pagina (um componente como vc pode ver)
        home: ProductOverviewScreen(),

        // rotas da aplicação
        routes: {
          AppRoutes.PRODUCT_DETAIL: (ctx) => ProductDetailScreen(),
        },
      ),
    );
  }
}
