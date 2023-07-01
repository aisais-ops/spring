import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spring/views/buyer/home.dart';
import 'package:spring/views/contact.dart';
import 'package:spring/views/createStore.dart';
import 'package:spring/views/buyer/favorite.dart';
import 'package:spring/views/login.dart';
import '../../profil.dart';
import 'package:firebase_auth/firebase_auth.dart';

Widget myDrawer(BuildContext context, bool ckeck) {
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
                          /*Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const ProfilLancher()), // navigate to profile page
                          );*/
                           Navigator.pushReplacementNamed(context,'profilLancher');
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
                                'Geust',
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

                  /* Wishlist button menu */
                  ListTile(
                    leading: const Icon(Icons.favorite_outline_outlined),
                    title: const Text(
                      "WISHLIST",
                      style: TextStyle(color: Colors.brown),
                    ),
                    onTap: () {
                      // Wishlist button action

                      /*Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const FavoriteLancher()),
                      );*/
                       Navigator.pushReplacementNamed(context,'favoriteLancher');
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
                      /*Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ContactUsLancher()),
                      );*/
                       Navigator.pushReplacementNamed(context,'contactUsLancher');
                    },
                  ),

                  /*become a seller button */
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xff986C40),
                      minimumSize: const Size(100, 40),
                      maximumSize: const Size(200, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      "BECOME A SELLER",
                      style: TextStyle(fontSize: 15, letterSpacing: 1),
                    ),
                    onPressed: () {
                      // TODO: implement registration logic
                      /*Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CreateStoreLancher()),
                      );*/
                       Navigator.pushReplacementNamed(context,'createStoreLancher');
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
            label: Text(
              ckeck ? "LOGOUT" : "LOGIN",
              style: TextStyle(color: Colors.brown),
            ),
            icon: Icon(
              ckeck ? Icons.logout_rounded : Icons.login_rounded,
              color: Colors.brown,
            ),
            onPressed: () async {
              auth.signOut().then((value) => /*Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ckeck?HomeLancher():LoginLancher(),
                  ))*/
                   Navigator.pushReplacementNamed(context,ckeck?'homeLancher':'loginlancher'));

              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.setString('typeUser', 'Geust');
            },
          )),
        ),
      ],
    ),
  );
}
