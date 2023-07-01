
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spring/views/contact.dart';
import 'package:spring/views/createStore.dart';
import 'package:spring/views/buyer/favorite.dart';
import 'package:spring/views/login.dart';
import '../../profil.dart';
import 'package:firebase_auth/firebase_auth.dart';

Widget myDrawer1(BuildContext context) {
  final auth = FirebaseAuth.instance;
  return Drawer(
    backgroundColor: const Color(0xFFfe4cdaa),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        /* Drawer items */
        Expanded(
          child: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.only(
                  top: 50, left: 30, right: 20, bottom: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  /*username , profil image and settings icon */
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          // TODO: implement image tap action
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const ProfilLancher()), // navigate to profile page
                          );
                        },
                        child: Container(
                          height: 50,
                          child: Row(
                            /*username , profil image */
                            children: [
                              /*profil image */
                              Image.asset(
                                  'images/logo.png',
                                  width: 65,
                                  height: 65,
                                ),
                              
                              const SizedBox(width: 7),
                              /*username */
                              const Text(
                                'USERNAME',
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                      ),

                      /*settings icon */
                      IconButton(
                        icon: const Icon(Icons.settings),
                        onPressed: () {},
                      )
                    ],
                  ),

                  /* Order button menu */
                  ListTile(
                    leading: const Icon(Icons.shopping_bag_outlined),
                    title: const Text(
                      "ORDERS",
                      style: TextStyle(color: Colors.brown),
                    ),
                    onTap: () {
                      // Home button action
                    },
                  ),

                  /* ADD PRODUCT button menu */
                  ListTile(
                    leading: const Icon(Icons.favorite_outline_outlined),
                    title: const Text(
                      "ADD PRODUCT",
                      style: TextStyle(color: Colors.brown),
                    ),
                    onTap: () {
                      // ADD PRODUCT button action

                      /*Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const FavoriteLancher()),
                      );*/

                    },
                  ),
                   /* INVENTORY button menu */
                  ListTile(
                    leading: const Icon(Icons.favorite_outline_outlined),
                    title: const Text(
                      "INVENTORY",
                      style: TextStyle(color: Colors.brown),
                    ),
                    onTap: () {
                      // INVENTORY button action

                      /*Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const FavoriteLancher()),
                      );*/
                      
                    },
                  ),

                  /* Coupons button menu */
                  ListTile(
                    leading: const Icon(Icons.discount_outlined),
                    title: const Text(
                      "COUPONS",
                      style: TextStyle(color: Colors.brown),
                    ),
                    onTap: () {
                      // Coupons button action
                    },
                  ),


                  /* Contact us button menu */
                  ListTile(
                    leading: const Icon(Icons.phone_outlined),
                    title: const Text(
                      "CONTACT US",
                      style: TextStyle(color: Colors.brown),
                    ),
                    onTap: () {
                      // Contact us button action
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ContactUsLancher()),
                      );
                    },
                  ),

                  //add more drawer menu here
                ],
              ),
            ),
          ),
        ),

        /* Fixed button at the bottom logout*/
        Container(
          height: 80,
          width: double.infinity,
          child: Center(
              child: ElevatedButton.icon(
            style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.transparent),
              elevation: MaterialStatePropertyAll(0),
            ),
            label: const Text(
              'LOGOUT',
              style: TextStyle(color: Colors.brown),
            ),
            icon: const Icon(
              Icons.logout_rounded,
              color: Colors.brown,
            ),
            onPressed: () async{
              auth.signOut().then(
                (value) => /*Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginLancher(),
                  )
                )*/
                 Navigator.pushReplacementNamed(context,'loginLancher')
              );
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.setString('typeUser', 'Geust');
            },
          )),
        ),
      ],
    ),
  );
}
