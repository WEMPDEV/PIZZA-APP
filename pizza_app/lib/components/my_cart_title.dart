import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:pizza_app/components/my_quantity_selector.dart';
import 'package:pizza_app/models/cart_item.dart';
import 'package:pizza_app/models/restaurant.dart';
import 'package:provider/provider.dart';

import '../models/food.dart';

class MyCartTitle extends StatelessWidget {
  final CartItem cartItem;
  const MyCartTitle({super.key, required this.cartItem,});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
        builder: (context, restaurant, child) => Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(9)
          ),
          margin: EdgeInsets.symmetric(horizontal: 25,vertical: 10),
          child: Column(
            children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// food image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(9),
                    child: Image.network(
                      cartItem.food.imagePath,
                      height: 70,
                      width: 70,
                      fit: BoxFit.cover,
                      errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                        return Image.asset(
                          'assets/testimage.png', // Replace with your placeholder image path
                          height: 70,
                          width: 70,
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                  ),
                  SizedBox(width: 10,),
                  /// name and price
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(cartItem.food.name,style: TextStyle(fontSize: 17),),
                      // food price
                      Text(
                        "\$" + cartItem.food.price.toString(),
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 15
                        ),
                      ),
                    ],
                  ),

                  Spacer(),
                  /// increment and decrement
                  QuantitySelector(
                      quantity: cartItem.quantity,
                      food: cartItem.food,
                      onIncrement: (){
                        restaurant.addToCart(cartItem.food, cartItem.selectedAddons);
                      },
                      onDecrement:  (){
                        restaurant.removeFromCart(cartItem);
                      },
                  ),

                ],
              ),
            ),
              /// addons
              SizedBox(
                height: cartItem.selectedAddons.isEmpty ? 0 : 60,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.only(left: 10,bottom: 10,right: 10),
                  children: cartItem.selectedAddons
                  .map(
                    ((addon) => Padding(
                      padding: const EdgeInsets.only(right: 8,bottom: 8),
                      child: FilterChip(
                          label: Row(
                            children: [
                              // addon name
                              Text(addon.name),
                              SizedBox(width: 3,),
                              // addon price
                              Text( "\$${addon.price.toString()}")
                            ],
                          ),
                          shape: StadiumBorder(
                            side: BorderSide(
                              color: Theme.of(context).colorScheme.primary
                            )
                          ),
                          onSelected: (value){},
                        backgroundColor: Theme.of(context).colorScheme.secondary,
                        labelStyle: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          fontWeight: FontWeight.bold,
                          fontSize: 14
                        ),
                      ),
                    )),
                  ).toList(),
                ),
              )

            ],
          ),
        )
    );
  }
}
