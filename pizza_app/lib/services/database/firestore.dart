import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  // get collection of orders 
  final CollectionReference orders = 
  FirebaseFirestore.instance.collection("orders");

  // save order to firestore db
  Future<void> saveOrderToDatabase(String receipt) async{
    await orders.add(
      {
        "date":DateTime.now(),
        "order":receipt,
        // add more field neccesary
      }
    );
  }
}