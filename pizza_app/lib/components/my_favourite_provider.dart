import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/food.dart';
class FavouriteSaved extends ChangeNotifier{
  final List< Food> _favourites =[];
  List< Food> get favourites => _favourites;

  void toggleFavourite( Food food){
    if(_favourites.contains(food)){
      _favourites.remove(food);
    } else{
      _favourites.add(food);
    }
    notifyListeners();
  }

  bool isExist( Food food){
    final isExist = _favourites.contains(food);
    return isExist;
  }
  static FavouriteSaved of(
      BuildContext context,{
        bool listen = true,
      }) {
    return Provider.of<FavouriteSaved>(
      context,
      listen: listen,
    );
  }

}


