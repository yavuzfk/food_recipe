import 'package:flutter/material.dart';
import 'package:food_recipe/screens/advices_page/widgets/advices_area.dart';
import 'package:food_recipe/screens/advices_page/widgets/page_body_container.dart';
import 'package:food_recipe/screens/advices_page/widgets/welcome_card.dart';
import 'package:food_recipe/screens/advices_page/widgets/welcome_card_container.dart';
import 'package:food_recipe/screens/search_food_page/search_recipe_page.dart';

import '../../utility/colors.dart';
import '../favourites_page/favourites_page.dart';

class AdvicesPage extends StatefulWidget {
  const AdvicesPage({Key? key}) : super(key: key);

  @override
  State<AdvicesPage> createState() => _AdvicesPageState();
}

class _AdvicesPageState extends State<AdvicesPage>
    with SingleTickerProviderStateMixin, WidgetsBindingObserver {
  String userName = "Abdulrezzak";
  late PageController pageController;
  int currentPageIndex = 0;
  late TabController tabController;

  void onTapped(int index) {
    setState(() {
      currentPageIndex = index;
    });
    pageController.jumpToPage(index);
  }

  @override
  void initState() {
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
            MainPageBodyContainer(
                innerWidget: SizedBox(
              child: PageView(
                controller: pageController,
                onPageChanged: onTapped,
                children: const [
                  MainPageBodyContainer(innerWidget: AdvicesArea()),
                  MainPageBodyContainer(innerWidget: SearchRecipePage()),
                  MainPageBodyContainer(innerWidget: FavouritesPage()),
                ],
              ),
            )),
          ]),
        ),
        bottomNavigationBar: BottomNavigationBar(
          // type: BottomNavigationBarType.fixed, // Fixed
          currentIndex: currentPageIndex,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          backgroundColor:
              ProjectColors().projectHeaderColor, // <-- This works for fixed
          selectedItemColor: Colors.white,
          unselectedItemColor: const Color.fromARGB(255, 158, 222, 160),
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
}
