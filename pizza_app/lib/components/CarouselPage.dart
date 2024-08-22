
import 'package:flutter/material.dart';
import '../models/food.dart';
import '../pages/fooddetails_page.dart';
import 'carousels.dart';
import 'my_food_tile.dart';

class Restaurant {
  final List<Food> menu;

  Restaurant({required this.menu});
}


class RestaurantCarouselsScreen extends StatefulWidget {
  final Restaurant restaurant;

  RestaurantCarouselsScreen({required this.restaurant});

  @override
  State<RestaurantCarouselsScreen> createState() => _RestaurantCarouselsScreenState();
}

class _RestaurantCarouselsScreenState extends State<RestaurantCarouselsScreen> {
  final ScrollController _scrollController = ScrollController();

  final Map<RestaurantCategory, GlobalKey> categoryKeys = {
    RestaurantCategory.Burgers: GlobalKey(),
    RestaurantCategory.Salads: GlobalKey(),
    RestaurantCategory.Sides: GlobalKey(),
    RestaurantCategory.Deserts: GlobalKey(),
    RestaurantCategory.Drinks: GlobalKey(),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            Carousel(
              scrollController: _scrollController,
              onItemTapped: _scrollToCategory,
            ),
            ...getFoodInThisCategory(widget.restaurant.menu),
          ],
        ),
      ),
    );
  }

  void _scrollToCategory(RestaurantCategory category) {
    final key = categoryKeys[category];
    if (key != null) {
      Scrollable.ensureVisible(
        key.currentContext!,
        duration: Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
    }
  }

  List<Widget> getFoodInThisCategory(List<Food> fullMenu) {
    return FoodCategory.values.map((category) {
      // get category menu
      List<Food> categoryMenu = _filterMenuByCategory(category, fullMenu);

      return Container(
        key: categoryKeys[category],
        child: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: categoryMenu.length,
          itemBuilder: (context, index) {
            // get individual food
            final food = categoryMenu[index];
            // return food title UI
            return FoodTile(
              food: food,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>  FooddetailsPage(food: food)),
                );
              },
            );
          },
        ),
      );
    }).toList();
  }

  List<Food> _filterMenuByCategory(FoodCategory category, List<Food> fullMenu) {
    return fullMenu.where((food) => food.category == category).toList();
  }
}
