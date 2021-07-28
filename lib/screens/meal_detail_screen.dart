import 'package:flutter/material.dart';
import '../dummy_data.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';
  final Function(String)? toggleFavorites;
  final Function(String)? isFav;

  MealDetailScreen(this.toggleFavorites, this.isFav);

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
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
          title: Text(selectedMeal.title),
        ),
        body: Container(
          padding: EdgeInsets.only(top: 45, left: 35, right: 25),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.elliptical(95, 95),
            ),
          ),
          margin: EdgeInsets.only(top: 30),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 270,
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      selectedMeal.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 15),
                  child: Text(
                    'Ingrediants',
                    style: Theme.of(context).textTheme.title,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white30,
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10)),
                  padding: EdgeInsets.all(10),
                  height: 150,
                  width: 300,
                  child: ListView.builder(
                    itemBuilder: (ctx, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            selectedMeal.ingredients[index],
                            textAlign: TextAlign.left,
                          ),
                          Divider(color: Colors.black),
                        ],
                      );
                    },
                    itemCount: selectedMeal.ingredients.length,
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 15),
                  child: Text(
                    'Steps',
                    style: Theme.of(context).textTheme.title,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white30,
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10)),
                  padding: EdgeInsets.all(10),
                  height: 150,
                  width: 300,
                  child: ListView.builder(
                    itemBuilder: (ctx, index) {
                      return Column(
                        children: [
                          ListTile(
                            leading: CircleAvatar(
                              child: Text('# ${index + 1}'),
                            ),
                            title: Text(
                              selectedMeal.steps[index],
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Divider(color: Colors.grey)
                        ],
                      );
                    },
                    itemCount: selectedMeal.ingredients.length,
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(isFav!(mealId) ? Icons.star : Icons.star_border),
          onPressed: () => toggleFavorites!(mealId),
          backgroundColor: const Color(0xFF00CCFF),
        ),
      ),
    );
  }
}
