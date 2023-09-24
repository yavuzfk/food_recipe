import 'package:bloc/bloc.dart';
import '../../../api/model/food_recipe.dart';

class CubitFavourites extends Cubit<List<FoodRecipe>> {
  CubitFavourites() : super([]);

  void addElement(FoodRecipe recipe) {
    state.add(recipe);
    emit(List.from(state));
  }
}
