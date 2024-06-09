import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:food_recipe/network_service/network_service.dart';
import 'package:meta/meta.dart';
import '../../../api/model/food_recipe_model.dart';

part 'recipe_list_event.dart';
part 'recipe_list_state.dart';

class BlocRecipeList extends Bloc<EventRecipeList, StateRecipeList> {
  BlocRecipeList() : super(StateRecipeListInitial()) {
    on<EventRecipeListLoad>(_fetchRecipeList);
  }
  List<FoodRecipe> foodList = [];

  FutureOr<List<FoodRecipe>?> _fetchRecipeList(
      EventRecipeListLoad event, Emitter<StateRecipeList> emit) async {
    emit(StateRecipeListLoading());
    final List<FoodRecipe>? foodList = await NetworkService().getFoodRecipes();
    if (foodList != null) {
      this.foodList = foodList;
      emit(StateRecipeListLoaded(foodList: foodList));
      return foodList;
    } else {
      emit(StateRecipeListError(errorMessage: "Fetching Error"));
      return null;
    }
  }
}
