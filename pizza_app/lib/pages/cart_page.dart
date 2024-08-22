import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:pizza_app/components/my_button.dart';
import 'package:pizza_app/components/my_cart_title.dart';
import 'package:pizza_app/models/restaurant.dart';
import 'package:pizza_app/pages/payment_pages.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
        builder: (context, restaurant, child){
          // cart
          final userCart = restaurant.cart;

          // scaffold UI
          return Scaffold(
            backgroundColor: Theme.of(context).colorScheme.background,
            appBar: AppBar(
              title: Text("Cart Items"),
              centerTitle: true,
              backgroundColor: Theme.of(context).colorScheme.background,
              foregroundColor: Theme.of(context).colorScheme.inversePrimary,
              actions: [
                // clear all cart
                IconButton(
                    onPressed: (){
                      showDialog(
                          context: context,
                          builder: (context)=> AlertDialog(
                            title: Text('Are you sure you want\n '
                                '   to cancel all cart'),
                            actions: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children:[
                                  SizedBox(height: 5,),
                                  // cancel button
                                  Center(
                                    child: TextButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(32),
                                        ),
                                        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                                      ),
                                      onPressed: () async {
                                        Navigator.pop(context);
                                      },
                                      child: const Text('No,Cancel',style: TextStyle(
                                          fontFamily: 'Nunito', fontWeight: FontWeight.bold,
                                          color: Colors.white
                                      ),),
                                    ),
                                  ),
                                  // yes button
                                  TextButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Theme.of(context).colorScheme.inversePrimary.withOpacity(0.4),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(32),
                                      ),
                                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                      restaurant.clearCart();
                                    },
                                    child: const Text('Yes,Clear all Cart Items',style: TextStyle(
                                        fontFamily: 'Nunito',fontWeight: FontWeight.bold,
                                        color: Colors.white
                                    ),),
                                  ),
                                ],
                              ),
                            ],
                          )
                      );
                    },
                    icon: Icon(Icons.delete)
                )
              ],
            ),
            body: Column(
              children: [
                // list of cart
                Expanded(
                  child: Column(
                    children: [
                      userCart.isEmpty ? Expanded(child: Center(child: Text('Cart is Empty...',style:
                        TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 20
                        ),))) :
                      Expanded(
                          child: ListView.builder(
                            itemCount: userCart.length,
                              itemBuilder: (context, index){
                              // get individual cart item
                                final cartItem = userCart[index];
                  
                                // cart tittle Ui
                                return MyCartTitle(cartItem: cartItem);
                              }
                  
                          ),
                      )
                    ],
                  ),
                ),
                // button to pay
                MyButton(
                    text: "Go to CheckOut",
                  onTap: (){
                      Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context)=> PaymentPage()
                      ));
                  },
                ),
                const SizedBox(height: 25,)
              ],
            ),
          );
        }
    );
  }
}
