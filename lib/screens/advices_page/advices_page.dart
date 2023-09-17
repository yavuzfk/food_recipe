import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipe/api/model/food_recipe.dart';
import 'package:food_recipe/screens/advices_page/bloc/recipe_list_bloc.dart';
import 'package:food_recipe/screens/advices_page/widgets/advices_area.dart';
import 'package:food_recipe/screens/advices_page/widgets/page_body_container.dart';
import 'package:food_recipe/screens/advices_page/widgets/welcome_card.dart';
import 'package:food_recipe/screens/advices_page/widgets/welcome_card_container.dart';
import 'package:food_recipe/screens/search_food_page/search_recipe_page.dart';

import '../../constants/utility/colors.dart';
import '../../core/atoms/page_progress_indicator.dart';
import '../favourites_page/favourites_page.dart';

class AdvicesPage extends StatefulWidget {
  const AdvicesPage({Key? key}) : super(key: key);
  // final List<FoodRecipe> foodList;
  @override
  State<AdvicesPage> createState() => _AdvicesPageState();
}

class _AdvicesPageState extends State<AdvicesPage>
    with SingleTickerProviderStateMixin, WidgetsBindingObserver {
  String userName = "Abdulrezzak";
  late PageController pageController;
  int currentPageIndex = 0;
  late TabController tabController;
  // late INetworkService networkService;
  late List<FoodRecipe> foodList;

  void onTapped(int index) {
    setState(() {
      currentPageIndex = index;
    });
    pageController.jumpToPage(index);
  }

  @override
  void initState() {
    // networkService = NetworkService();
    // foodList = widget.foodList;
    // getFoodList();
    pageController = PageController();
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Stack(children: [
            WelcomeCardContainer(innerWidget: WelcomeCard(title: userName)),
            BlocBuilder<BlocRecipeList, StateRecipeList>(
              builder: (context, state) {
                if (state is StateRecipeListInitial) {
                  BlocProvider.of<BlocRecipeList>(context)
                      .add(EventRecipeListLoad());
                  return const PageProgressIndicator();
                } else if (state is StateRecipeListLoading) {
                  return const PageProgressIndicator();
                } else if (state is StateRecipeListLoaded) {
                  foodList = state.foodList;
                  return MainPageBodyContainer(
                      innerWidget: SizedBox(
                    child: PageView(
                      controller: pageController,
                      onPageChanged: onTapped,
                      children: [
                        MainPageBodyContainer(
                            innerWidget: AdvicesArea(
                          foodList: foodList,
                        )),
                        MainPageBodyContainer(
                            innerWidget: SearchRecipePage(
                          foodList: foodList,
                        )),
                        const MainPageBodyContainer(
                            innerWidget: FavouritesPage()),
                      ],
                    ),
                  ));
                } else if (state is StateRecipeListError) {
                  return const Center(
                    child: Text("Fetching Error"),
                  );
                } else {
                  return const Center(
                    child: Text("Unknown Error"),
                  );
                }
              },
            ),
          ]),
        ),
        bottomNavigationBar: BottomNavigationBar(
          // type: BottomNavigationBarType.fixed, // Fixed
          currentIndex: currentPageIndex,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          backgroundColor:
              ProjectColors().projectRed, // <-- This works for fixed
          selectedItemColor: Colors.white,
          unselectedItemColor: const Color.fromARGB(255, 227, 184, 180),
          onTap: onTapped,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.card_giftcard_outlined),
              label: "Öneriler",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: "Yemek Ara",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: "Favoriler",
            ),
          ],
        ));
  }

  // Future<void> getFoodList() async {
  //   foodList = await networkService.getFoodRecipes();
  //   setState(() {
  //     foodList;
  //   });
  // }
}
