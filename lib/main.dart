import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipe/screens/advices_page/bloc/recipe_list_bloc.dart';
import 'package:food_recipe/screens/favourites_page/cubit/favourites_cubit.dart';
import 'package:food_recipe/screens/item_selection_page/bloc/item_selection_bloc.dart';
import 'package:food_recipe/screens/item_selection_page/item_selection_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<BlocRecipeList>(create: (context) => BlocRecipeList()),
          BlocProvider<CubitFavourites>(create: (context) => CubitFavourites()),
          BlocProvider<ItemSelectionBloc>(
              create: (context) => ItemSelectionBloc())
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const ItemSelectionPage(),
        ));
  }
}
