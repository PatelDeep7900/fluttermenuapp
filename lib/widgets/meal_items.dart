import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:udemyproject4/models/meal.dart';
import 'package:udemyproject4/widgets/meal_item_trait.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.meal,required this.onselectmeal});

  final void Function(Meal meal) onselectmeal;
  final Meal meal;

  @override
  Widget build(BuildContext context) {
    final CompexityText = meal.complexity.name[0].toUpperCase() + meal.complexity.name.substring(1);
    final affordText = meal.affordability.name[0].toUpperCase() + meal.affordability.name.substring(1);
    return Card(
      margin: EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child: InkWell(
        onTap: (){
          onselectmeal(meal);
        },
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  color: Colors.black54,
                  padding: EdgeInsets.symmetric(horizontal: 44, vertical: 6),
                  child: Column(
                    children: [
                      Text(
                        meal.title,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                           MealItemTrait(icon: Icons.schedule, lable: '${meal.duration} min'),
                          const SizedBox(width: 10,),
                          MealItemTrait(icon: Icons.work, lable: '${CompexityText}'),
                          const SizedBox(width: 10,),
                          MealItemTrait(icon: Icons.attach_money, lable: '${affordText}'),
                        ],
                      )
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
