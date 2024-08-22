import 'package:flutter/material.dart';
import 'package:pizza_app/models/food.dart';

import 'my_favourite_provider.dart';


class FoodTile extends StatelessWidget {
  final Food food;
  final Function()? onTap;

  const FoodTile({super.key, required this.food, this.onTap});

  @override
  Widget build(BuildContext context) {
    final provider = FavouriteSaved.of(context);
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                // text food details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: GestureDetector(
                              onTap: () => provider.toggleFavourite(food), // Corrected line
                              child: Icon(
                                provider.isExist(food)
                                    ? Icons.favorite
                                    : Icons.favorite_border_outlined,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Text(food.name,style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                        fontWeight: FontWeight.bold,
                        fontSize: 16
                      ),),
                      Text(
                        "\$" + food.price.toString(),
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        food.description,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary.withOpacity(0.7),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 35),
                // food image with fallback
                ClipRRect(
                  borderRadius: BorderRadius.circular(9),
                  child: Image.network(
                    food.imagePath,
                    height: 120,
                    width: 120,
                    fit: BoxFit.cover,
                    errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                      return Image.asset(
                        'assets/testimage.png', // Replace with your placeholder image path
                        height: 120,
                        width: 120,
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        Divider(
          color: Theme.of(context).colorScheme.tertiary,
          endIndent: 25,
          indent: 25,
        ),
      ],
    );
  }
}