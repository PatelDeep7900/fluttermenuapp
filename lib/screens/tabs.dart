import 'package:flutter/material.dart';
import 'package:udemyproject4/Provider/meal_provider.dart';
import 'package:udemyproject4/data/Dummt_data.dart';
import 'package:udemyproject4/models/meal.dart';
import 'package:udemyproject4/screens/categories.dart';
import 'package:udemyproject4/screens/filtters.dart';
import 'package:udemyproject4/screens/meals.dart';
import 'package:udemyproject4/widgets/main_drawer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
const KinitFilter = {
  filtter.GlutinFree : false,
  filtter.LactoseFree : false,
  filtter.Vagetarian : false,
  filtter.Vegan : false,
};


class TabScreens extends ConsumerStatefulWidget {
  const TabScreens({super.key});

  @override
  ConsumerState<TabScreens> createState() {
    return _TabScreensState();
  }
}

class _TabScreensState extends ConsumerState<TabScreens> {

  int _navigationScreenIndex = 0;
  final List<Meal> _Favorite = [];
  Map<filtter,bool> _selectedFilter= KinitFilter;


  void FavoriteStatuse(String msg) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  void FavoriteItems(Meal meal) {
    var isExist = _Favorite.contains(meal);
    if (isExist) {
      setState(() {
        _Favorite.remove(meal);
        FavoriteStatuse('Removed from the Favorite.......');
      });
    } else {
      setState(() {
        _Favorite.add(meal);
        FavoriteStatuse('Added in Favorite');
      });
    }
  }

  void _selectedScreen(String ids) async {
    Navigator.of(context).pop();
    if (ids == 'filtter') {
     final result= await Navigator.of(context).push<Map<filtter, bool>>(
          MaterialPageRoute(builder: (ctx) => FiltterScreen(currentFilter: _selectedFilter),)
      );
     setState(() {
       _selectedFilter = result ??  KinitFilter;
     });

    }
  }

  void oneselectnavigattion(int index) {
    setState(() {
      _navigationScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Meal = ref.watch(MealProvider);
    final availableMeal = Meal.where((meal) {
      if(_selectedFilter[filtter.GlutinFree]! && !meal.isGlutenFree){
        return false;
      }
      if(_selectedFilter[filtter.LactoseFree]! && !meal.isLactoseFree){
        return false;
      }
      if(_selectedFilter[filtter.Vagetarian]! && !meal.isVegetarian){
        return false;
      }
      if(_selectedFilter[filtter.Vegan]! && !meal.isVegan){
        return false;
      }
      return true;
    }).toList();

    Widget activescreen = Categories(
      FavoriteItems: FavoriteItems,
      availableMeal: availableMeal,
    );
    String activeTitle = 'Categories';

    if (_navigationScreenIndex == 1) {
      activescreen = MealScreen(
        meals: _Favorite,
        FavoriteItems: FavoriteItems,
      );
      activeTitle = 'Your Favorite';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activeTitle),
      ),
      drawer: MainDrawer(onselectScreen: _selectedScreen),
      body: activescreen,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _navigationScreenIndex,
        onTap: oneselectnavigattion,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: 'Category'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorite'),
        ],
      ),
    );
  }
}
