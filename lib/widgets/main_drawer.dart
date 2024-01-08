

import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key,required this.onselectScreen});
  final void Function(String ids) onselectScreen;

  @override
  Widget build(BuildContext context) {
    return   Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding:  EdgeInsets.all(20),
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Theme.of(context).colorScheme.primaryContainer,
                  Theme.of(context).colorScheme.primaryContainer.withOpacity(0.8),
                ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
            ),
            child:
            Row(
              children: [
                 Icon(Icons.fastfood, size: 48,color: Theme.of(context).colorScheme.primary ),
                SizedBox(width: 15,),
                Text('Cooking up!',style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.restaurant),
            title: Text('Meals',style: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
              fontSize: 24
            ),),
            onTap: (){
              onselectScreen('meal');
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Filtters',style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
                fontSize: 24
            ),),
            onTap: (){
              onselectScreen('filtter');
            },
          ),

        ],
      ),
    );
  }
}
