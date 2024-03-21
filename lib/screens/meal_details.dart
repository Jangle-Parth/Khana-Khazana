import 'package:flutter/material.dart';
import 'package:khana_khazana/models/meal.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen({super.key, required this.meal});

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Center(
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                meal.imageUrl,
              ),
              maxRadius: 100,
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          Text(
            'Ingredeints Required :',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 14),
          for (final ingredient in meal.ingredients) Text(ingredient),
          const SizedBox(
            height: 24,
          ),
          Text(
            'Steps :',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 14),
          for (final step in meal.steps)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Text(
                step,
                textAlign: TextAlign.center,
              ),
            ),
        ]),
      ),
    );
  }
}