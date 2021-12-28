import 'package:flutter/material.dart';
import 'package:meals/models/dummy-data.dart';
import 'package:meals/widgets/meal_detail_widget.dart';

class MealsDetailPage extends StatelessWidget {
  static const routeName = '/meals-detail';

  final Function(String) toggleFavorite;
  final bool Function(String) isMealFavorite;
  MealsDetailPage(this.toggleFavorite, this.isMealFavorite);

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) {
      return meal.id == mealId;
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: MealDetailWidget(selectedMeal),
      floatingActionButton: FloatingActionButton(
        child: Icon(
            isMealFavorite(selectedMeal.id) ? Icons.star : Icons.star_border),
        onPressed: () {
          toggleFavorite(selectedMeal.id);
        },
      ),
    );
  }
}
