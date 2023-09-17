import 'package:bloc/bloc.dart';
import '../../../api/model/food_recipe.dart';

class FavouritesCubit extends Cubit<List<FoodRecipe>> {
  FavouritesCubit() : super([]);

  void addElement(FoodRecipe recipe) {
    state.add(recipe);
    emit(List.from(state));
  }
}
