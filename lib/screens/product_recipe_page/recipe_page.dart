import 'package:flutter/material.dart';

import '../../core/atoms/black_divider.dart';

class RecipePage extends StatefulWidget {
  const RecipePage({Key? key}) : super(key: key);
  // final String imagePath;
  // final String listName;
  @override
  _RecipePageState createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  final String image5 =
      'https://cdn.yemek.com/mnresize/940/940/uploads/2022/08/100-gram-kiymayla-karniyarik-one-cikan.jpg';
  final String listName = "Sana Özel Tarifler";
  final String foodName = "Karnıyarık";
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ImageArea(image5: image5),
          Container(
            height: MediaQuery.of(context).size.height * 0.66,
            color: Colors.white,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: Text(
                    foodName,
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text(listName),
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
              const Padding(
                padding: EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Malzemeler",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text("- 3 Adet Patlıcan"),
                    Text("- 3 Adet Patates"),
                    Text("- 250gr Kıyma"),
                    Text("- 2 Adet Sarımsak"),
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
