import 'package:flutter/material.dart';
import 'package:pizza_app/models/restaurant.dart';
import 'package:provider/provider.dart';

class MyReciept extends StatelessWidget {
  const MyReciept({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 25,right: 25,bottom: 25,top: 50),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Thank you for your Order!"),
            SizedBox(height: 25,),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9),
                border: Border.all(
                  color: Theme.of(context).colorScheme.secondary
                )
              ),
              padding: EdgeInsets.all(25),
              child:
                Consumer<Restaurant>(
                    builder: (context, restaurant,child)
                        => Text(restaurant.displayCartReciept())
                ),
            ),
            SizedBox(height: 25,),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9),
                  border: Border.all(
                      color: Theme.of(context).colorScheme.secondary
                  )
              ),
              padding: EdgeInsets.all(25),
              child:
              Consumer<Restaurant>(
                  builder: (context, restaurant,child)
                  => Text(restaurant.displayEstimatedDeliveryTime())
              ),
            ),
          ],
        ),
      ),
    );
  }
}
