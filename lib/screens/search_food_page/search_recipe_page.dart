import 'package:flutter/material.dart';

import '../../constants/utility/colors.dart';

class SearchRecipePage extends StatefulWidget {
  const SearchRecipePage({Key? key}) : super(key: key);

  @override
  _SearchRecipePageState createState() => _SearchRecipePageState();
}

class _SearchRecipePageState extends State<SearchRecipePage> {
  final String image1 =
      'https://www.nizampide.com/wp-content/uploads/2018/07/nizam-special-kar%C4%B1%C5%9F%C4%B1k-kebap-%C4%B1zgara-porsiyon-nizam-pide-s%C3%BCtla%C3%A7-istanbul-beyo%C4%9Flu-istiklal-caddesi-600x600.jpg';
  final String image2 =
      'https://cdn.yemek.com/mnresize/1250/833/uploads/2023/01/lokanta-usulu-et-sote-sunum-yemekcom.jpg';
  final String image3 =
      'https://ferishtah.com/wp-content/uploads/2019/03/Menemen-Nas%C4%B1l-Yap%C4%B1l%C4%B1r.jpg';
  final String image4 =
      'https://cdn.yemek.com/mnresize/1250/833/uploads/2020/09/tereyagli-pilav-one-cikan.jpg';
  final String image5 =
      'https://cdn.yemek.com/mnresize/940/940/uploads/2022/08/100-gram-kiymayla-karniyarik-one-cikan.jpg';
  final String image6 =
      'https://cdn.yemek.com/mnresize/940/940/uploads/2020/08/manti-tarifi-guncelleme-son.jpg';
  final String image7 =
      'https://cdn.yemek.com/mncrop/620/388/uploads/2017/01/ev-usulu-pizza-yeni.jpg';
  final String image8 = 'https://i.ytimg.com/vi/6Idb-Zhjiv8/maxresdefault.jpg';

  late TextEditingController controller;
  List<FoodModel> backupList = [];
  List<FoodModel> foodList = [];

  @override
  void initState() {
    controller = TextEditingController();
    foodList.add(FoodModel(
        name: "Karnıyarık",
        malzemeSayisi: 5,
        imagePath: image1,
        isFavourite: true));
    foodList.add(FoodModel(
        name: "Makarna",
        malzemeSayisi: 4,
        imagePath: image3,
        isFavourite: true));
    foodList.add(FoodModel(
        name: "Köri Tavuk",
        malzemeSayisi: 7,
        imagePath: image2,
        isFavourite: true));
    foodList.add(FoodModel(
        name: "Karnıyarık",
        malzemeSayisi: 5,
        imagePath: image1,
        isFavourite: true));
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
                                  item.imagePath!,
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
    List<FoodModel>? foundedList = backupList.where((element) {
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

class FoodModel {
  String? name;
  int? malzemeSayisi;
  String? imagePath;
  bool? isFavourite;

  FoodModel(
      {required this.name,
      required this.malzemeSayisi,
      required this.imagePath,
      required this.isFavourite});
}
