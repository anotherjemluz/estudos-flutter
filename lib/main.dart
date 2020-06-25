import 'package:flutter/material.dart';

import 'config/app_routes.dart';

import 'screens/categories_screen.dart';
import 'screens/categories_meals_screen.dart';
import 'screens/meal_detail_screen.dart';

void main() => runApp(FitnessApp());

class FitnessApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vamos Cozinhar?',
      theme: ThemeData(
        primarySwatch: Colors.green,
        accentColor: Colors.green,
        fontFamily: 'Raleway',
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
              title: TextStyle(
                fontSize: 18,
                fontFamily: 'RobotoCondensed'
              ),
          ),
      ),
      // home: CategoriesScreen(),
      // initialRoute: '/',
      // routes: { 
      //   '/': (ctx) => CategoriesScreen(),
      //   '/categories-meals': (ctx) => CategoriesMealsScreen()
      // },
      routes: { 
        AppRoutes.HOME: (ctx) => CategoriesScreen(),
        AppRoutes.CATEGORIES_MEALS: (ctx) => CategoriesMealsScreen(),
        AppRoutes.MEAL_DETAIL: (ctx) => MealDetailScreen()
      },
      // onGenerateRoute: (settings) {
      //   if(settings.name == '/a') {
      //     return null;
      //   } else if (settings.name == '/a') {
      //     return null;
      //   } else {
      //     return MaterialPageRoute(
      //       builder: (_) {
      //         return ErrorScreen();
      //       }
      //     );
      //   }
      // },
      // onUnknownRoute: (settings) {
      //   same that generateRoute
      // },
    );
  }
}
