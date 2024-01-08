import 'package:flutter/material.dart';
import 'package:udemyproject4/data/Dummt_data.dart';
import 'package:udemyproject4/models/category.dart';
import 'package:udemyproject4/models/meal.dart';
import 'package:udemyproject4/screens/meals.dart';
import 'package:udemyproject4/widgets/category_grid_items.dart';

class Categories extends StatelessWidget {
  Categories({super.key,required this.FavoriteItems,required this.availableMeal});
  final void Function(Meal meal) FavoriteItems;
  final List<Meal> availableMeal;

  void _selectcategory(BuildContext context, Category category) {
    final filltermeal = availableMeal
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) =>
            MealScreen(title: category.title, meals: filltermeal,FavoriteItems: FavoriteItems,)));
  }


  @override
  Widget build(BuildContext context) {
      return GridView(
        padding: EdgeInsets.all(20),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
        ),
        children: [
          for (final category in availableCategories)
            CategoryGridItems(
              category: category,
              onselectCategory: () => _selectcategory(context, category),
            )
        ],
      );

  }
}
