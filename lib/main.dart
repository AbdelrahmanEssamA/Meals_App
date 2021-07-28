import 'package:flutter/material.dart';
import './dummy_data.dart';
import './screens/filters_screen.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';
import './screens/tab_screen.dart';
import 'screens/category_meal.dart';
import 'screens/categoris.dart';
import './screens/category_meal.dart';
import './models/meal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegeterian': false,
  };
  List<Meal> _avilableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _avilableMeals = DUMMY_MEALS.where((element) {
        if (_filters['gluten'] == true && !element.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] == true && !element.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] == true && !element.isVegan) {
          return false;
        }
        if (_filters['vegeterian'] == true && !element.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealID) {
    final existingIndex =
        _favoriteMeals.indexWhere((meal) => mealID == meal.id);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => mealID == meal.id));
      });
    }
  }

  bool _isMealFav(String id) {
    return _favoriteMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              title: TextStyle(
                  fontSize: 21,
                  fontFamily: 'RobotoCondense',
                  fontWeight: FontWeight.normal))),
      routes: {
        '/': (ctx) => TabsScreen(_favoriteMeals),
        CategoryMealsScreen.routeName: (ctx) =>
            CategoryMealsScreen(_avilableMeals),
        MealDetailScreen.routeName: (ctx) =>
            MealDetailScreen(_toggleFavorite, _isMealFav),
        FiltersScreen.routeName: (ctx) => FiltersScreen(_setFilters, _filters),
      },
      onGenerateRoute: (settings) {
        print(settings.arguments);
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
    );
  }
}
