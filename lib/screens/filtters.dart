import 'package:flutter/material.dart';
import 'package:udemyproject4/screens/meals.dart';
import 'package:udemyproject4/screens/tabs.dart';
import 'package:udemyproject4/widgets/main_drawer.dart';

enum filtter {
  GlutinFree,
  LactoseFree,
  Vagetarian,
  Vegan,
}
class FiltterScreen extends StatefulWidget {
  const FiltterScreen({super.key,required this.currentFilter});
  final Map<filtter,bool> currentFilter;


  @override
  State<FiltterScreen> createState() => _FiltterScreenState();
}
class _FiltterScreenState extends State<FiltterScreen> {
  var glutinfreeFiltterSet = false;
  var LactosefreeFiltterSet = false;
  var VagetarianFiltterSet = false;
  var VeganFiltterSet = false;

  @override
  void initState() {
    glutinfreeFiltterSet = widget.currentFilter[filtter.GlutinFree]!;
    LactosefreeFiltterSet = widget.currentFilter[filtter.LactoseFree]!;
    VagetarianFiltterSet = widget.currentFilter[filtter.Vagetarian]!;
    VeganFiltterSet = widget.currentFilter[filtter.Vegan]!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pop(
            {
           filtter.GlutinFree : glutinfreeFiltterSet,
           filtter.LactoseFree : LactosefreeFiltterSet,
           filtter.Vagetarian:VagetarianFiltterSet,
           filtter.Vegan:VeganFiltterSet,
        }
        );
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Your filtters'),
        ),
        // drawer: MainDrawer(onselectScreen: (ids){
        //   Navigator.of(context).pop();
        //   if(ids == 'meal'){
        //     Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=> TabScreens()));
        //   }
        // }),
        body: Column(
          children: [
            SwitchListTile(
              value: glutinfreeFiltterSet,
              onChanged: (isCheak){
                setState(() {
                  glutinfreeFiltterSet = isCheak;
                });
              },
              title: Text('Glutin-free',style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: EdgeInsets.only(right: 22,left: 34),
              subtitle: Text('Only glutin-free meals',style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),)
            ),
            SwitchListTile(
                value: LactosefreeFiltterSet,
                onChanged: (isCheak){
                  setState(() {
                    LactosefreeFiltterSet = isCheak;
                  });
                },
                title: Text('Lactose-free',style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),),
                activeColor: Theme.of(context).colorScheme.tertiary,
                contentPadding: EdgeInsets.only(right: 22,left: 34),
                subtitle: Text('Only Lactose-free meals',style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),)
            ),
            SwitchListTile(
                value: VagetarianFiltterSet,
                onChanged: (isCheak){
                  setState(() {
                    VagetarianFiltterSet = isCheak;
                  });
                },
                title: Text('Vagetarian',style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),),
                activeColor: Theme.of(context).colorScheme.tertiary,
                contentPadding: EdgeInsets.only(right: 22,left: 34),
                subtitle: Text('Only Vagetarian meals',style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),)
            ),
            SwitchListTile(
                value: VeganFiltterSet,
                onChanged: (isCheak){
                  setState(() {
                    VeganFiltterSet = isCheak;
                  });
                },
                title: Text('Vegan',style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),),
                activeColor: Theme.of(context).colorScheme.tertiary,
                contentPadding: EdgeInsets.only(right: 22,left: 34),
                subtitle: Text('Only Vegan meals',style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),)
            )
          ],
        ),
      ),
    );
  }
}
