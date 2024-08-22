import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:pizza_app/models/food.dart';

class MyTabBar extends StatelessWidget {
  final TabController tabController ;
  const MyTabBar({super.key, required this.tabController});

  List<Tab> _buildCategoryTabs(){
    return FoodCategory.values.map((category){
      return Tab(
        text: category.toString().split(".").last,
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TabBar(labelColor: Colors.redAccent,unselectedLabelColor: Theme.of(context).colorScheme.inversePrimary,
        controller: tabController,
          tabs: _buildCategoryTabs(),
      ),
    );
  }
}
