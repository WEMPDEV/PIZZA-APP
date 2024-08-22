import 'package:flutter/material.dart';
import 'package:pizza_app/pages/cart_page.dart';
import 'package:pizza_app/pages/favorite_pages.dart';

class MySilverAppBar extends StatelessWidget {
  final Widget title;
  final Widget child;
  const MySilverAppBar({super.key,
    required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Theme.of(context).colorScheme.background,
      foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: Center(child: Text("Exclusive Diner's",style: TextStyle(
        fontWeight: FontWeight.bold
      ),)),
      expandedHeight: 575,
      collapsedHeight: 120,
      floating: false,
      pinned: true,
      actions: [
        // wish list
        IconButton(
            onPressed: (){
              // GO to wishlist page
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Favouritpage()));
            },
            icon: Icon(Icons.favorite)
        ),
        // cart button
        IconButton(
            onPressed: (){
              // GO to cart page
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CartPage()));
            },
            icon: Icon(Icons.shopping_cart),
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: const EdgeInsets.only(bottom: 50),
          child: child,
        ),
        title: title,
        centerTitle: true,
        titlePadding: EdgeInsets.only(left: 0,right: 0,top: 0),
        expandedTitleScale: 1,
      ),
    );
  }
}
