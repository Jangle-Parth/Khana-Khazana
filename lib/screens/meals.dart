import 'package:flutter/material.dart';
import 'package:khana_khazana/models/meal.dart';
import 'package:khana_khazana/screens/meal_details.dart';
import 'package:khana_khazana/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen(
      {Key? key,
      this.title,
      required this.meals,
      required this.onToggleFavorite})
      : super(key: key);

  final String? title;
  final List<Meal> meals;
  final void Function(Meal meal) onToggleFavorite;

  void selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (ctx) => MealDetailsScreen(
              meal: meal, onToggleFavorite: onToggleFavorite)),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
      itemCount: meals.length,
      itemBuilder: (ctx, index) => MealItem(
        meal: meals[index],
        onToggleFavorite: onToggleFavorite,
      ),
    );

    if (meals.isEmpty) {
      content = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset("assets/images/nothinghere.png"),
          ],
        ),
      );
    }
    if (title == null) {
      return content;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: content,
    );
  }
}
