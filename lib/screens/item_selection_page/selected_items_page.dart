// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:food_recipe/screens/advices_page/advices_page.dart';
import 'package:kartal/kartal.dart';

import '../../api/model/food_recipe.dart';
import '../../network_service/network_service.dart';
import 'item_selection_page.dart';

class SelectedItemsPage extends StatefulWidget {
  const SelectedItemsPage({Key? key, required this.selectedList})
      : super(key: key);
  final List<ListData> selectedList;
  @override
  _SelectedItemsPageState createState() => _SelectedItemsPageState();
}

class _SelectedItemsPageState extends State<SelectedItemsPage> {
  late INetworkService networkService;
  List<FoodRecipe>? foodList;

  @override
  void initState() {
    networkService = NetworkService();
    getFoodList();
    super.initState();
  }

  Future<void> getFoodList() async {
    foodList = await networkService.getFoodRecipes();
    setState(() {
      foodList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFEEEEEE),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                Text(
                  "EVİNDEKİ MALZEMELER",
                  style: TextStyle(
                      fontSize: 36.0,
                      fontWeight: FontWeight.bold,
                      foreground: Paint()
                        ..shader = LinearGradient(
                          colors: <Color>[
                            Colors.blueGrey.shade800,
                            const Color.fromARGB(255, 23, 20, 173),
                          ],
                        ).createShader(
                            const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0))),
                ),
                SizedBox(
                  height: context.sized.dynamicHeight(0.62),
                  child: ListView.builder(
                      itemCount: widget.selectedList.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            title: Text(widget.selectedList[index].data ?? "_"),
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            if (foodList == null) {
              await Future.delayed(const Duration(seconds: 2));
            }
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AdvicesPage(foodList: foodList!),
                ));
          },
          elevation: 0,
          backgroundColor: const Color.fromARGB(255, 23, 20, 173),
          splashColor: Colors.blueGrey.shade800,
          child: const Text("Devam Et"),
        ),
      ),
    );
  }

  Widget selectionIcons(bool isSelected) {
    return Icon(
      isSelected ? Icons.check_box : Icons.check_box_outline_blank,
      color: Theme.of(context).primaryColor,
    );
  }
}