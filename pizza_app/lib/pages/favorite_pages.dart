import 'package:flutter/material.dart';

import '../components/my_favourite_provider.dart';
import 'cart_page.dart';

class Favouritpage extends StatefulWidget {
  const Favouritpage({super.key});

  @override
  State<Favouritpage> createState() => _FavouritpageState();
}

class _FavouritpageState extends State<Favouritpage> {
  @override
  Widget build(BuildContext context) {
    final provider = FavouriteSaved.of(context);
    final finaList = provider.favourites;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Padding(
            padding: const EdgeInsets.only(top: 30),
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
          Padding(
            padding: const EdgeInsets.only(top: 0,left: 20),
            child: Row(
              children: [
                const Text('Favourites',style: TextStyle(
                    fontWeight: FontWeight.bold,fontSize: 27,color:  Color(0xFF25364A)
                ),),
                const SizedBox(width: 200,),
                IconButton(onPressed: (){
                  // GO to cart page
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CartPage()));
                }, icon: const Icon(Icons.shopping_cart,color:Color(0xFF25364A) ,)),
              ],
            ),
          ),
          Expanded(child:
          ListView.builder(
              itemCount: finaList.length,
              itemBuilder: (context, index){
                return Padding(padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(
                      finaList[index].name,
                      style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      finaList[index].description,
                      overflow: TextOverflow.ellipsis,
                    ),
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.blueGrey,
                      backgroundImage: NetworkImage(
                          finaList[index].imagePath,
                      ),
                    ),
                    trailing: Text("\$${finaList[index].price}",
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                      ),),
                  ),);
              })
          ),
        ],
      ),
    );
  }
}
