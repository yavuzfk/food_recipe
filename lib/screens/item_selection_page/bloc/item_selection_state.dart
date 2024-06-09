part of 'item_selection_bloc.dart';

@immutable
sealed class ItemSelectionState {}

sealed class ItemSelectionActionState extends ItemSelectionState {}

final class ItemSelectionInitial extends ItemSelectionState {}

final class ItemSelectionLoadingState extends ItemSelectionState {}

final class ItemSelectionLoadedState extends ItemSelectionState {
  final List<FoodItem> dataList;

  ItemSelectionLoadedState({required this.dataList});
}

final class ItemSelecitonNewItemState extends ItemSelectionState {
  final List<FoodItem> dataList;

  ItemSelecitonNewItemState(this.dataList);
}

final class ItemSelectionConfirmButtonState extends ItemSelectionState {
  final List<FoodItem> selectedList;

  ItemSelectionConfirmButtonState({required this.selectedList});
}

final class ItemSelectionSearchState extends ItemSelectionState {
  final List<FoodItem> dataList;

  ItemSelectionSearchState(this.dataList);
}

final class ItemSelectionErrorState extends ItemSelectionState {
  final String errorMessage;

  ItemSelectionErrorState(this.errorMessage);
}
