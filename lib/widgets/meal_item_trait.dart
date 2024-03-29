import 'package:flutter/material.dart';

class MealItemTrait extends StatelessWidget{
  MealItemTrait({super.key,required this.icon,required this.lable});

  final String lable;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon,size: 17,color: Colors.white,),
        const SizedBox(width: 6,),
        Text(lable,style: const TextStyle(color: Colors.white),),
      ],
    );
  }

}