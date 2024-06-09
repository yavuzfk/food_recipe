import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:food_recipe/api/model/food_item_model.dart';
import 'package:food_recipe/api/data/food_items.dart';
import 'package:meta/meta.dart';

import '../../../api/data/selected_item_list.dart';
import '../item_selection_page.dart';

part 'item_selection_event.dart';
part 'item_selection_state.dart';

class ItemSelectionBloc extends Bloc<ItemSelectionEvent, ItemSelectionState> {
  ItemSelectionBloc() : super(ItemSelectionInitial()) {
    on<ItemSelectionInitialEvent>(itemSelectionInitialEvent);
    on<ItemSelectionAddEvent>(itemSelectionAddEvent);
    on<ItemSelectionSearchEvent>(itemSelectionSearchEvent);
    on<ItemSelectionConfirmButtonEvent>(itemSelectionConfirmButtonEvent);
  }

  FutureOr<void> itemSelectionInitialEvent(
      ItemSelectionInitialEvent event, Emitter<ItemSelectionState> emit) async {
    emit(ItemSelectionLoadingState());
    await Future.delayed(const Duration(seconds: 2));

    emit(ItemSelectionLoadedState(
        dataList: FoodItems.foodItems
            .map((e) => FoodItem(id: e['id'], name: e['name'], selected: false))
            .toList()));
  }

  FutureOr<void> itemSelectionAddEvent(
      ItemSelectionAddEvent event, Emitter<ItemSelectionState> emit) {
    selectedFoodItemList.contains(event.item)
        ? selectedFoodItemList.remove(event.item)
        : selectedFoodItemList.add(event.item);
    emit(ItemSelectionLoadedState(dataList: event.dataList));
  }

  FutureOr<void> itemSelectionSearchEvent(
      ItemSelectionSearchEvent event, Emitter<ItemSelectionState> emit) {
    final input = event.searchText.toLowerCase();
    List<FoodItem> tempList = event.dataList;
    tempList = tempList.where((element) {
      return element.name!.toLowerCase().contains(input);
    }).toList();
    if (tempList.isEmpty) {
      emit(ItemSelectionLoadedState(dataList: event.dataList));
    } else {
      emit(ItemSelectionLoadedState(dataList: tempList));
    }
  }

  FutureOr<void> itemSelectionConfirmButtonEvent(
      ItemSelectionConfirmButtonEvent event, Emitter<ItemSelectionState> emit) {
    print("Confirm Button Pressed");
    emit(ItemSelectionConfirmButtonState(selectedList: selectedFoodItemList));
  }
}
