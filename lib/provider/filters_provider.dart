import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/provider/meals_provider.dart';

enum Filters {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

class FilterNotifier extends StateNotifier<Map<Filters, bool>> {
  FilterNotifier()
      : super({
          Filters.glutenFree: false,
          Filters.lactoseFree: false,
          Filters.vegetarian: false,
          Filters.vegan: false,
        });

  void setFilters(Filters filters, bool isActive) {
    state = {...state, filters: isActive};
  }
  void setFilter (Map<Filters,bool> chosenFilters) {
       state = chosenFilters;
  }
}

final filterProvider =
    StateNotifierProvider<FilterNotifier, Map<Filters, bool>>(
        (ref) => FilterNotifier());
        
        final filteredMealsProvider =Provider((ref)
        {  final meals = ref.watch(mealsProvider);
       final activeFilters = ref.watch(filterProvider);
        return meals.where((meals) {
           if (activeFilters[Filters.glutenFree]! && !meals.isGlutenFree) {
        return false;
      }
      if (activeFilters[Filters.lactoseFree]! && !meals.isGlutenFree) {
        return false;
      }
      if (activeFilters[Filters.vegetarian]! && !meals.isGlutenFree) {
        return false;
      }
      if (activeFilters[Filters.vegan]! && !meals.isGlutenFree) {
        return false;
      }
        return true;
    }).toList();
        }
        );
