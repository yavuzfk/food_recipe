import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipe/api/model/food_item_model.dart';
import 'package:food_recipe/constants/utility/colors.dart';
import 'package:kartal/kartal.dart';

import '../../constants/utility/color_lists.dart';
import 'bloc/item_selection_bloc.dart';
import 'selected_items/selected_items_page.dart';

class ItemSelectionPage extends StatefulWidget {
  const ItemSelectionPage({Key? key}) : super(key: key);

  @override
  _ItemSelectionPageState createState() => _ItemSelectionPageState();
}

class _ItemSelectionPageState extends State<ItemSelectionPage> {
  final ItemSelectionBloc bloc = ItemSelectionBloc();
  late final TextEditingController _controller;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    bloc.add(ItemSelectionInitialEvent());
    _controller = TextEditingController();
    super.initState();
  }

  Widget selectionIcons(bool isSelected) {
    return Icon(
      isSelected ? Icons.check_box : Icons.check_box_outline_blank,
      color: ProjectColors().projectRed,
    );
  }

  Padding searchBar() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0, top: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
              width: context.sized.dynamicWidth(0.86),
              child: TextField(
                textInputAction: TextInputAction.go,
                onSubmitted: (value) {
                  // dataList = dataListTemp;
                },
                controller: _controller,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'Evindeki Malzemeleri Seç',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.deepOrange)),
                ),
                // onChanged: searchStaff,
              )),
        ],
      ),
    );
  }

/*    searchStaff(String query) {
     setState(() {
       final input = query.toLowerCase();
      dataList = dataListTemp.where((element) {
        return element.name!.toLowerCase().contains(input);
      }).toList();
     });
 } */

  @override
  Widget build(BuildContext context) {
    List<FoodItem> dataList = [];
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFEEEEEE),
        body: BlocConsumer<ItemSelectionBloc, ItemSelectionState>(
          bloc: bloc,
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            if (state is ItemSelectionInitial) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ItemSelectionLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ItemSelectionLoadedState) {
              dataList = state.dataList;
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    children: [
                      Text(
                        "EVİNDE BULUNAN MALZEMELERİ SEÇ",
                        style: TextStyle(
                            fontSize: 36.0,
                            fontWeight: FontWeight.bold,
                            foreground: Paint()
                              ..shader = LinearGradient(
                                colors: redColorList,
                                // colors: purpleProjectColors,
                              ).createShader(
                                  const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0))),
                      ),
                      searchBar(),
                      SizedBox(
                        height: context.dynamicHeight(0.62),
                        child: ListView.builder(
                            itemCount: dataList.length,
                            itemBuilder: (context, index) {
                              FoodItem? item = dataList[index];
                              bool isSelected = item.selected;
                              return Card(
                                child: ListTile(
                                  onTap: () {
                                    bloc.add(ItemSelectionAddEvent(
                                        item: item, dataList: dataList));
                                  },
                                  title: Text(item.name ?? "_"),
                                  leading: selectionIcons(item.selected),
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                ),
              );
            } else if (state is ItemSelectionConfirmButtonState) {
              return const Center();
            } else if (state is ItemSelectionErrorState) {
              return Center(child: Text(state.errorMessage));
            } else {
              return const Center(
                child: Text("sfsdsdf"),
              );
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            List<FoodItem> selectedList = <FoodItem>[];
            for (int i = 0; i < dataList.length; i++) {
              if (dataList[i].selected == true) {
                selectedList.add(dataList[i]);
              }
            }
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        SelectedItemsPage(selectedList: selectedList)));
          },
          elevation: 0,
          backgroundColor: ProjectColors().projectRed,
          splashColor: Colors.white,
          child: const Icon(
            Icons.done_all_outlined,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class ListData {
  ListData({this.id, this.data});

  String? data;
  int? id;
  bool selected = false;
}
