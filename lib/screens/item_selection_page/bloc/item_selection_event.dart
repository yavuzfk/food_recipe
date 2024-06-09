part of 'item_selection_bloc.dart';

@immutable
sealed class ItemSelectionEvent {}

final class ItemSelectionInitialEvent extends ItemSelectionEvent {}

final class ItemSelectionAddEvent extends ItemSelectionEvent {
  final FoodItem item;
  final List<FoodItem> dataList;

  ItemSelectionAddEvent({required this.item, required this.dataList});
}

final class ItemSelectionConfirmButtonEvent extends ItemSelectionEvent {
  final List<ListData> selectedList;

  ItemSelectionConfirmButtonEvent(this.selectedList);
}

final class ItemSelectionSearchEvent extends ItemSelectionEvent {
  final String searchText;
  final List<FoodItem> dataList;
  ItemSelectionSearchEvent({required this.searchText, required this.dataList});
}
