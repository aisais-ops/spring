import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spring/models/Produit.dart';
import 'package:spring/models/utilisateur.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spring/models/vendeur.dart';
import 'package:flutter/material.dart';
import 'package:spring/views/buyer/home.dart';

class ProductViewModel {
  Future<List<Produit>> getProducts() async {
    List<Produit> productList = [];

    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('products').get();

    querySnapshot.docs.forEach((DocumentSnapshot document) {
      Produit produit = Produit();
      /*Map<String, dynamic> productData =
          document.data() as Map<String, dynamic>;
      productData['id'] = document.id;
      */
      produit.code = document.id;
      produit.label = document.get('name');
      produit.images.add(document.get('image')[0]);
      produit.pu = document.get('price').toDouble();
      productList.add(produit);
    });

    return productList;
  }

  Future<Produit?> getProductById(String? productId) async {
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection('products')
        .doc(productId)
        .get();

    if (snapshot.exists) {
      Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
      Produit produit = Produit();
      //print(data["image"][0]);
      produit.label = data["name"];
      produit.pu = data["price"].toDouble();
      produit.description = data["description"];
      for (var element in data["image"]) {
        produit.images.add( element);
      }
      
      
      return produit;
    } else {
      return null; // Product with the given ID does not exist
    }
  }
}
