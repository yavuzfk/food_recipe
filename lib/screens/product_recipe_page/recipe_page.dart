import 'package:flutter/material.dart';
import 'package:food_recipe/api/model/food_recipe_model.dart';

import '../../core/atoms/black_divider.dart';

class RecipePage extends StatefulWidget {
  const RecipePage({super.key, required this.selectedRecipe});
  final FoodRecipe selectedRecipe;

  @override
  State<RecipePage> createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  bool isFavorite = false;
  late final List<String> materials;

  @override
  void initState() {
    //TODO: Favori listesinde bu ürün varsa kalp dolu gözükecek
    materials = widget.selectedRecipe.materials!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ImageArea(image5: widget.selectedRecipe.image!),
          Container(
            height: MediaQuery.of(context).size.height * 0.66,
            color: Colors.white,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: Text(
                    widget.selectedRecipe.name!,
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text(widget.selectedRecipe.listName!),
                  trailing: IconButton(
                      onPressed: () {
                        setState(() {
                          isFavorite = !isFavorite;
                        });
                      },
                      icon: isFavorite
                          ? const Icon(Icons.favorite_outlined)
                          : const Icon(Icons.favorite_border_outlined)),
                ),
              ),
              const BlackDivider(),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Malzemeler",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 100,
                      child: ListView.builder(
                        itemCount: materials.length,
                        itemBuilder: (context, index) {
                          var material = materials[index];
                          //XXX: materials map almış içerisine, string list e çekmek lazım
                          return Text("- $material");
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const BlackDivider(),
              const Padding(
                padding: EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Tarif",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text("1-) Patlıcanları yarım yarım yarın"),
                    Text("2-) Patatesleri kenara alın izlesinler"),
                    Text("3-) Kıymaya kıymayın çok pahalandı"),
                    Text("4-) Sarımsaklar saklanabilir"),
                    Text(
                        "5-) Getir den sipariş verin, afiyet olsun. Soğuk servis edin."),
                  ],
                ),
              )
            ]),
          ),
        ],
      ),
    );
  }
}

class ImageArea extends StatelessWidget {
  const ImageArea({
    super.key,
    required this.image5,
  });

  final String image5;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.34,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.network(
                image5,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 36.0, left: 8),
          child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_rounded,
                color: Colors.white,
                size: 34,
              )),
        ),
      ],
    );
  }
}
