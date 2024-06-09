import 'package:flutter/material.dart';

import '../../api/model/food_recipe_model.dart';
import '../../constants/utility/colors.dart';

class SearchRecipePage extends StatefulWidget {
  const SearchRecipePage({Key? key, this.foodList}) : super(key: key);
  final List<FoodRecipe>? foodList;
  @override
  _SearchRecipePageState createState() => _SearchRecipePageState();
}

class _SearchRecipePageState extends State<SearchRecipePage> {
  late TextEditingController controller;
  List<FoodRecipe> backupList = [];
  List<FoodRecipe> foodList = [];

  @override
  void initState() {
    controller = TextEditingController();
    foodList = widget.foodList!;
    backupList = foodList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.77,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(34)),
          color: ProjectColors().projectPageColorWhite,
        ),
        child: Column(
          children: [
            const HeaderTextArea(),
            Padding(
              padding: const EdgeInsets.only(
                left: 24.0,
                right: 24.0,
                top: 6.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.84,
                      child: foodList.isNotEmpty
                          ? TextField(
                              textInputAction: TextInputAction.go,
                              onSubmitted: (value) {
                                foodList = backupList;
                              },
                              controller: controller,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.search),
                                hintText: 'Akşam yemekte ne var?',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(
                                        color: Colors.deepOrange)),
                              ),
                              onChanged: searchStaff,
                            )
                          : const SizedBox()),
                ],
              ),
            ),
            Container(
                padding: const EdgeInsets.only(left: 24, right: 24, top: 18),
                height: MediaQuery.of(context).size.height * 0.63,
                child: ListView.builder(
                  itemCount: foodList.length,
                  itemBuilder: (context, index) {
                    var item = foodList[index];
                    return Container(
                        height: 180,
                        margin: const EdgeInsets.only(bottom: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Stack(
                          children: [
                            Container(
                              width: 350,
                              height: 260,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(
                                  item.image!,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                height: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Colors.transparent,
                                      Colors.black.withOpacity(1),
                                    ],
                                  ),
                                ),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 8.0, top: 16),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item.name!,
                                        style: const TextStyle(
                                            fontSize: 21,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const Text(
                                        "Mazlemeler Hazır!",
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ));
                  },
                )),
          ],
        ),
      ),
    );
  }

  searchStaff(String query) {
    final input = query.toLowerCase();
    List<FoodRecipe>? foundedList = backupList.where((element) {
      return element.name!.toLowerCase().contains(input);
    }).toList();
    if (foundedList.isEmpty) {
      foodList = backupList;
    } else {
      foodList = foundedList;
    }
    setState(() {
      foodList;
    });
  }
}

class HeaderTextArea extends StatelessWidget {
  const HeaderTextArea({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 8),
      width: MediaQuery.of(context).size.width * 0.87,
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Aklındaki Tarifi Bulalım",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
