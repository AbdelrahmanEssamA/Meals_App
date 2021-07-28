import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_Item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoritesList;
  FavoritesScreen(this.favoritesList);
  @override
  Widget build(BuildContext context) {
    if (favoritesList.isEmpty) {
      return Container(
        child: Center(child: Text('You have no favorites yet')),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return Container(
            margin: EdgeInsets.only(top: 20, right: 10, left: 10),
            child: MealItem(
                favoritesList[index].id,
                favoritesList[index].title,
                favoritesList[index].imageUrl,
                favoritesList[index].affordability,
                favoritesList[index].complexity,
                favoritesList[index].duration),
          );
        },
        itemCount: favoritesList.length,
      );
    }
  }
}
