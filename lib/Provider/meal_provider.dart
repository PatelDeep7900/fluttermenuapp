import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:udemyproject4/data/Dummt_data.dart';

final MealProvider = Provider((ref){
  return dummyMeals;
});