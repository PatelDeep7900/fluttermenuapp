import 'package:flutter/material.dart';
import 'package:udemyproject4/models/meal.dart';
import 'package:udemyproject4/screens/meal_details.dart';
import 'package:udemyproject4/widgets/meal_items.dart';

class MealScreen extends StatelessWidget {
  MealScreen({super.key, this.title, required this.meals, required this.FavoriteItems});
  final String? title;
  List<Meal> meals;
  final void Function(Meal meal) FavoriteItems;
  void onselectmeal(BuildContext context,Meal meal){
    Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=> MealDetailsScreen(meal: meal,FavoriteItems: FavoriteItems,)));
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Uh oh... Nothing here!",
              style: Theme.of(context).textTheme!.headlineLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onBackground)),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Try selecting different category!",
            style: Theme.of(context)
                .textTheme!
                .bodyLarge
                ?.copyWith(color: Theme.of(context).colorScheme.onBackground),
          )
        ],
      ),
    );
    if (meals.isNotEmpty)
      content = ListView.builder(
          itemCount: meals.length,
          itemBuilder: (ctx, index) => MealItem(meal: meals[index],onselectmeal: (meal){
            onselectmeal(context, meal);
          },)
      );

    if(title == null){
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
