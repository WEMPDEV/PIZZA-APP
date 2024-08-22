import 'package:flutter/material.dart';
import 'package:pizza_app/components/carousels.dart';
import 'package:pizza_app/components/current_location.dart';
import 'package:pizza_app/components/my_description_box.dart';
import 'package:pizza_app/components/my_drawer.dart';
import 'package:pizza_app/components/my_food_tile.dart';
import 'package:pizza_app/components/my_silver_app_bar.dart';
import 'package:pizza_app/components/my_tab_bar.dart';
import 'package:pizza_app/models/food.dart';
import 'package:pizza_app/models/restaurant.dart';
import 'package:pizza_app/pages/fooddetails_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {

  // tab bar controller
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    _tabController = TabController(length: 5, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();
  }

  //sort out and return a list of food items that belongs to a specific category
  List<Food> _filterMenuByCategory(FoodCategory category,List<Food> fullMenu){
    return fullMenu.where((food) => food.category == category ).toList();
  }

  // methos to return list of all foods in given category
  List<Widget> getFoodInThisCategory(List<Food> fullMenu){

    return FoodCategory.values.map((category){
      // get category menu
      List<Food> categoryMenu = _filterMenuByCategory(category, fullMenu);

      return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: categoryMenu.length,
          itemBuilder: (context, index) {
          // get individual food
            final food = categoryMenu[index];
            // return food tittle UI
            return FoodTile(food: food,onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> FooddetailsPage(food: food)));
            },);
        }
      );
    }).toList();
  }
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background.withOpacity(0.9),
      drawer: MyDrawer(),
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
              MySilverAppBar(
                title: MyTabBar(tabController: _tabController),
                  child:  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Divider(
                        indent: 25,
                        endIndent: 25,
                        color: Theme.of(context).colorScheme.tertiary,
                      ),
                      // my current location
                      MyCurrentLocation(),

                      // description box
                      MyDescriptionBox(),

                      Text('Categories',
                        style: TextStyle(
                          fontSize: 20,
                            color: Theme.of(context).colorScheme.inversePrimary,
                          fontWeight: FontWeight.bold
                        )
                      ),
                      SizedBox(height: 5,),

                      Carousel(scrollController: _scrollController, onItemTapped: (RestaurantCategory ) {

                      },),
                    ],
                  ),
                
              )
          ],
          body: Consumer<Restaurant>(
              builder: (context, restaurant, child) => TabBarView(
                controller: _tabController,
                  children:
                    getFoodInThisCategory(restaurant.menu)
              )
          )
      ),
    );
  }
}
