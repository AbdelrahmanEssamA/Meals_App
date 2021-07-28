import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../screens/meal_detail_screen.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  MealItem(this.id, this.title, this.imageUrl, this.affordability,
      this.complexity, this.duration);

  String get ComplexityText {
    if (complexity == Complexity.Simple) return 'Simple';
    if (complexity == Complexity.Challenging) return 'Challenging';
    if (complexity == Complexity.Hard) return 'hard';
    return 'Unknown';
  }

  String get AffordabilityText {
    if (affordability == Affordability.Affordable) return 'Affordable';
    if (affordability == Affordability.Pricey) return 'Pricey';
    if (affordability == Affordability.Luxurious) return 'Luxurious';
    return 'Unknown';
  }

  void selectMeal(BuildContext context) {
    Navigator.of(context).pushNamed(MealDetailScreen.routeName, arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Padding(
        padding: const EdgeInsets.only(left: 9, right: 6),
        child: GlassContainer(
          blur: 4,
          shadowStrength: 10,
          opacity: 0.3,

          //--code to remove border
          border: Border.fromBorderSide(BorderSide.none),

          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    child: Image.network(imageUrl,
                        height: 170, width: double.infinity, fit: BoxFit.cover),
                  ),
                  Positioned(
                    bottom: 15,
                    right: 0,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12),
                              bottomLeft: Radius.circular(12))),
                      width: 270,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: Text(
                        title,
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                            fontWeight: FontWeight.w300),
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.schedule),
                        SizedBox(
                          width: 6,
                        ),
                        Text('$duration min'),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.work),
                        SizedBox(
                          width: 6,
                        ),
                        Text(ComplexityText),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.attach_money),
                        SizedBox(
                          width: 3,
                        ),
                        Text(AffordabilityText),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
