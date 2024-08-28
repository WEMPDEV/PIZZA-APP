import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:pizza_app/components/CarouselPage.dart';
import 'package:pizza_app/components/my_cart_title.dart';
import 'package:pizza_app/components/my_reciepts.dart';
import 'package:pizza_app/services/database/firestore.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:provider/provider.dart';

class DeliveryProgressPage extends StatefulWidget {
  const DeliveryProgressPage({super.key});

  @override
  State<DeliveryProgressPage> createState() => _DeliveryProgressPageState();
}

class _DeliveryProgressPageState extends State<DeliveryProgressPage> {

// get acces to db
FirestoreService db = FirestoreService();

// @override
//   void initState(){
//     super.initState();

//   String receipt = context.read< Restaurant>().displayCartReciept();
//   db.saveOrderToDatabase(receipt);  
  
//   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text("Delivery in Progress..."),
        backgroundColor:  Theme.of(context).colorScheme.background,
        centerTitle: true,
      ),
      bottomNavigationBar: _buildBottomNavBar(context),
      body: Column(
        children: [
          MyReciept(),
        ],
      ),
    );
  }

  // custom Bottom Nav Bar:/ call delivery driver
 Widget  _buildBottomNavBar(BuildContext context){
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius:
        BorderRadius.only(topRight: Radius.circular(40),
            topLeft: Radius.circular(40))
      ),
      padding: EdgeInsets.all(25),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              shape: BoxShape.circle,
            ),
            child: IconButton(
                onPressed: (){}, 
                icon: Icon(Icons.person)
            ),
          ),
          SizedBox(width: 10,),
          // driver details
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Mr Johny",style:
                TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.inversePrimary
                ),),
              Text("Driver",style:
              TextStyle(
                  color: Theme.of(context).colorScheme.primary
              ),),
            ],
          ),
          Spacer(),
          Row(
            children: [
              // message button
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                    onPressed: (){},
                    icon: Icon(Icons.message,
                      color: Theme.of(context).colorScheme.primary,)
                ),
              ),
              SizedBox(width: 10,),
              // call button
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                    onPressed: (){},
                    icon: Icon(Icons.call,color: Colors.green,)
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
