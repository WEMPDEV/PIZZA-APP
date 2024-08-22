import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:pizza_app/components/my_button.dart';
import 'package:pizza_app/main.dart';
import 'package:pizza_app/models/restaurant.dart';
import 'package:provider/provider.dart';

import '../models/food.dart';

class FooddetailsPage extends StatefulWidget {
  final Food food;
  final Map<Addons, bool> selectedAddons = {};

  FooddetailsPage({super.key, required this.food}) {
    // initialize selected addons to false
    for (Addons addons in food.avialableAddons) {
      selectedAddons[addons] = false;
    }
  }

@override
  State<FooddetailsPage> createState() => _FooddetailsPageState();
}

class _FooddetailsPageState extends State<FooddetailsPage> {

  // method to add to cart
  void addToCart(Food food, Map<Addons, bool> selectedAddons) {
    // close current page back to menu page
    Navigator.pop(context);

    // format the selected addons
    List<Addons> currentlySelectedAddons =[];
    for (Addons addons in widget.food.avialableAddons){
      if (widget.selectedAddons[addons] == true){
        currentlySelectedAddons.add(addons);
      }
    }
    // add to cart
    context.read<Restaurant>().addToCart(food, currentlySelectedAddons);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // scaffold ui
        Scaffold(
          backgroundColor: Theme
              .of(context)
              .colorScheme
              .background,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Food image with BoxFit.cover
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Image.network(
                    widget.food.imagePath,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    errorBuilder: (BuildContext context, Object exception,
                        StackTrace? stackTrace) {
                      return Image.asset(
                        'assets/testimage.png',
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // food name
                      Text(
                        widget.food.name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      // food price
                      Text(
                        "\$${widget.food.price.toString()}",
                        style: TextStyle(
                          color: Theme
                              .of(context)
                              .colorScheme
                              .primary,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 10),
                      // food description
                      Text(
                        widget.food.description,
                        style: TextStyle(fontSize: 17),
                      ),
                      Divider(color: Theme
                          .of(context)
                          .colorScheme
                          .secondary),
                      SizedBox(height: 10),
                      Text(
                        'Add-ons',
                        style: TextStyle(
                          color: Theme
                              .of(context)
                              .colorScheme
                              .inversePrimary,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      // addons
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme
                                .of(context)
                                .colorScheme
                                .secondary,
                          ),
                          borderRadius: BorderRadius.circular(9),
                        ),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: widget.food.avialableAddons.length,
                          itemBuilder: (context, index) {
                            // get individual addons
                            Addons addons = widget.food.avialableAddons[index];

                            return CheckboxListTile(
                              title: Text(addons.name),
                              subtitle: Text(
                                "\$${addons.price.toString()}",
                                style: TextStyle(
                                  color: Theme
                                      .of(context)
                                      .colorScheme
                                      .primary,
                                ),
                              ),
                              value: widget.selectedAddons[addons],
                              onChanged: (bool? value) {
                                setState(() {
                                  widget.selectedAddons[addons] = value!;
                                });
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                // button to add to cart
                MyButton(
                  text: "Add to Cart",
                  onTap: () => addToCart(widget.food, widget.selectedAddons),
                ),
                SizedBox(height: 15),
              ],
            ),
          ),
        ),
        // back button
        SafeArea(
          child: Opacity(
            opacity: 0.6,
            child: Container(
              margin: EdgeInsets.only(left: 20),
              decoration: BoxDecoration(
                color: Theme
                    .of(context)
                    .colorScheme
                    .secondary,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios_new_rounded),
              ),
            ),
          ),
        ),
      ],
    );
  }
}


//
// class FooddetailsPage extends StatefulWidget {
//   final Food food;
//   final Map<Addons,bool> selectedAddons = {};
//    FooddetailsPage({super.key, required this.food}){
//    // initialize selected addons to false
//   for (Addons addons in food.avialableAddons){
//     selectedAddons[addons] = false;
//   }}
//   @override
//   State<FooddetailsPage> createState() => _FooddetailsPageState();
// }
//
// class _FooddetailsPageState extends State<FooddetailsPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         // scaffold ui
//         Scaffold(
//           backgroundColor: Theme.of(context).colorScheme.background,
//           body: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 //food image
//                 // Image(image: AssetImage(widget.food.imagePath)),
//                 // Image.asset(widget.food.imagePath),
//                 // Image(image: AssetImage("assets/35TH MFM.png"),),
//                 Image(image: NetworkImage(widget.food.imagePath,)),
//
//                 Padding(
//                   padding: const EdgeInsets.all(25.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       // food name
//                       Text(widget.food.name,style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 20
//                       ),),
//
//                       // food price
//                       Text( "\$" + widget.food.price.toString(),style: TextStyle(
//                           color: Theme.of(context).colorScheme.primary,
//                           fontSize: 18
//                       ),),
//                       SizedBox(height: 10,),
//
//                       //food description
//                       Text(widget.food.description,style: TextStyle(
//                           fontSize: 17
//                       ),),
//                       Divider(color: Theme.of(context).colorScheme.secondary,),
//                       SizedBox(height: 10,),
//
//                       Text('Add-ons',style:
//                       TextStyle(
//                           color: Theme.of(context).colorScheme.inversePrimary,
//                           fontSize: 17,
//                           fontWeight: FontWeight.bold
//                       ),),
//
//                       SizedBox(height: 10,),
//                       // addons
//                       Container(
//                         decoration: BoxDecoration(
//                             border: Border.all(
//                                 color: Theme.of(context).colorScheme.secondary
//                             ),
//                             borderRadius: BorderRadius.circular(9)
//                         ),
//                         child:  ListView.builder(
//                             shrinkWrap: true,
//                             physics: NeverScrollableScrollPhysics(),
//                             itemCount: widget.food.avialableAddons.length,
//                             itemBuilder: (context,index){
//                               // get individual addons
//                               Addons addons = widget.food.avialableAddons[index];
//
//                               return CheckboxListTile(
//                                 title: Text(addons.name),
//                                 subtitle: Text("\$" + addons.price.toString(),
//                                   style: TextStyle(color: Theme.of(context).colorScheme.primary),),
//                                 value: widget.selectedAddons[addons],
//                                 onChanged: (bool? value){
//                                   setState(() {
//                                     widget.selectedAddons[addons] = value!;
//                                   });
//                                 },
//                               );
//                             }
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 // button to add to cart
//                 MyButton(
//                   text: "Add to Cart",
//                   onTap: (){
//
//                   },
//                 ),
//                 SizedBox(height: 15,),
//               ],
//             ),
//           ),
//         ),
//
//         // back button
//         SafeArea(
//           child: Opacity(
//             opacity: 0.6,
//             child: Container(
//               margin: EdgeInsets.only(left: 20),
//               decoration: BoxDecoration(
//                 color: Theme.of(context).colorScheme.secondary,
//                 shape: BoxShape.circle
//               ),
//               child: IconButton(
//                   onPressed: (){
//                     Navigator.pop(context);
//                   },
//                   icon: Icon(Icons.arrow_back_ios_new_rounded)
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
