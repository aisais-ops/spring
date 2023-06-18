import 'package:flutter/material.dart';
import 'package:spring/views/cart.dart';
import 'package:spring/views/favorite.dart';


PreferredSizeWidget? myAppBar(BuildContext context, String pageTitle) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    /*shopping icon button */
    leading: IconButton(
      icon: const Icon(Icons.shopping_bag_outlined),
      color: Colors.brown,
      onPressed: () {
        // Handle menu button press
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const cartLancher()),
          );
      },
    ),

    /*title tool bar */
    title: Text(pageTitle),
    titleTextStyle:
        const TextStyle(color: Colors.brown, fontWeight: FontWeight.bold),
    centerTitle: true,
    actions: <Widget>[
      /*heart icon button */
      IconButton(
        icon: const Icon(Icons.favorite_outline_outlined),
        color: Colors.brown,
        onPressed: () {
          // Handle search button press
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const FavoriteLancher()),
          );
        },
      ),

      /*Open drawer menu */
      Builder(builder: (context) {
        /*menu icon button */
        return IconButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          icon: const Icon(Icons.menu_rounded),
          color: Colors.brown,
        );
      }),
    ],

    /*gradient of tool bar*/
    
  );
}
