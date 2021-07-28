import 'package:flutter/material.dart';
import 'package:meals_app/models/category.dart';
import '../dummy_data.dart';
import '../widgets/meal_Item.dart';
import '../models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/categories';
  final List<Meal> availableMeals;
  CategoryMealsScreen(this.availableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final String categoryTitle = routeArgs['title'].toString();
    final categoryId = routeArgs['id'].toString();
    final CategoryMeals = widget.availableMeals.where((element) {
      return element.categories.contains(categoryId);
    }).toList();

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color.fromRGBO(11, 193, 191, 1),
            const Color(0xFF00CCFF),
          ],
          begin: const FractionalOffset(0.0, 0.0),
          end: const FractionalOffset(1.0, 0.0),
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Text(categoryTitle),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return Container(
              margin: EdgeInsets.only(top: 20, right: 10, left: 10),
              child: MealItem(
                  CategoryMeals[index].id,
                  CategoryMeals[index].title,
                  CategoryMeals[index].imageUrl,
                  CategoryMeals[index].affordability,
                  CategoryMeals[index].complexity,
                  CategoryMeals[index].duration),
            );
          },
          itemCount: CategoryMeals.length,
        ),
      ),
    );
  }
}
