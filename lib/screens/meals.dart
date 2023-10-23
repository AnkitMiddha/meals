
import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/meals_details.dart';
import 'package:meals/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget
{ final String? title;
 final List<Meal> meals;


  const MealsScreen({super.key,  this.title,required this.meals,});

  void selectMeal(BuildContext context,Meal meal)
  {
      Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>  MealsDetailsScreen(meal: meal,)));
  }
  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
      itemCount: meals.length,
      itemBuilder: (ctx,index) => MealItem(meal: meals[index], onSelectMeal: (meal)
    
    {
 selectMeal(context, meal);
    }
      ))
    ;
    if(meals.isEmpty)
    {
      return  Center(  child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
         Text('Ohh.. Nothing Here!',style: Theme.of(context).textTheme.headlineLarge!.copyWith(color: Theme.of(context).colorScheme.onBackground)),
         const SizedBox(height: 16,),
          Text('Try a diffrent category',style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Theme.of(context).colorScheme.onBackground),),
          

        ],
      ),);
    }
    if(title==null)
    {
           return content;
    }
   return Scaffold(
    appBar: AppBar(
      title:  Text(title!),
    ),
    body:content
   );
}
}