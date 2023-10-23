import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:meals/screens/tabs.dart';
// import 'package:meals/widgets/main_drawer.dart';
import "package:meals/provider/filters_provider.dart";



class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key,});

  @override
 
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final activeFilters = ref.watch(filterProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
  
      body:  Column(
          children: [
            SwitchListTile(
              
              value: activeFilters[Filters.glutenFree]!,
              onChanged: (isChecked) {
               ref.read(filterProvider.notifier).setFilters(Filters.glutenFree ,isChecked);
              },
              title: Text(
                'Gluten-Free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'only include gluten-free meals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(right: 22, left: 34),
            ),
            const SizedBox(
              height: 16,
            ),
            SwitchListTile(
              value: activeFilters[Filters.lactoseFree]!,
              onChanged: (isChecked) {
               ref.read(filterProvider.notifier).setFilters(Filters.lactoseFree ,isChecked);
              },
              title: Text(
                'Lactose-Free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'only include lactose-free meals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(right: 22, left: 34),
            ),
            const SizedBox(
              height: 16,
            ),
            SwitchListTile(
              value:activeFilters[Filters.vegetarian]!,
              onChanged: (isChecked) {
               ref.read(filterProvider.notifier).setFilters(Filters.vegetarian ,isChecked);
              },
              title: Text(
                'Vegetarian',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'only include Vegetarian meals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(right: 22, left: 34),
            ),
            const SizedBox(
              height: 16,
            ),
            SwitchListTile(

              value: activeFilters[Filters.vegan]!,
              onChanged: (isChecked) {
               ref.read(filterProvider.notifier).setFilters(Filters.vegan,isChecked);
              },
              title: Text(
                'Vegan',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'only include Vegan meals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(right: 22, left: 34),
            ),
          ],
        ),
      
    );
  }
}
