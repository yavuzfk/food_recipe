part of 'recipe_list_bloc.dart';

@immutable
sealed class StateRecipeList {}

final class StateRecipeListInitial extends StateRecipeList {}

final class StateRecipeListLoading extends StateRecipeList {}

final class StateRecipeListLoaded extends StateRecipeList {
  final List<FoodRecipe> foodList;

  StateRecipeListLoaded({required this.foodList});
}

final class StateRecipeListError extends StateRecipeList {
  final String errorMessage;

  StateRecipeListError({required this.errorMessage});
}
