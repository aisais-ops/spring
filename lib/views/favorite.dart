//import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:spring/views/home.dart';
import 'widgets/appBar.dart';
import 'widgets/drawer.dart';

class FavoriteLancher extends StatelessWidget {
  const FavoriteLancher({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Favorite(),
    );
  }
}

class Favorite extends StatefulWidget {
  const Favorite({super.key});

  @override
  State<Favorite> createState() {
    return _Favorite();
  }
}

class _Favorite extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    String a = "Newest";
    return Scaffold(
        appBar: myAppBar(context, 'FAVORITE'),
        drawer: myDrawer(context),
        body: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 30),
          child: SingleChildScrollView(
          
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /*Search input*/
              Center(
                child: SizedBox(
                  height: 35,
                  width: 260,
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xfff2efe8),
                      contentPadding: const EdgeInsets.only(
                        top: 10,
                        right: 10,
                        left: 10,
                      ),
                      hintText: 'Product, Store, Etc...',
                      hintStyle: const TextStyle(color: Colors.brown),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 141, 110, 99),
                          width: 2.0,
                        ),
                      ),
                      suffixIcon: const Icon(
                        Icons.search,
                        color: Colors.brown,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 70,
              ),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  /*sort by text */
                  Row(
                    children: [
                      const Text('sort by ',style: TextStyle(fontSize: 20,color: Color(0xff76573e)),),
                      Text('${a}',style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Color(0xff76573e)),)
                    ],
                  ),

                  /*filter icon */
                  IconButton(
                    icon: const Icon(Icons.add_road,color: Color(0xff76573e)),
                    onPressed: (){},
                  ),

                  
                ],
              ),

              const Center(
                child: Icon(
                  Icons.favorite_outline,
                  color: Color(0xff76573e),
                  size: 100,
                )
              ),

              /*No favoris yet */
              const Center(
                child: Text(
                  'No favoris yet',
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(0xff76573e)
                  ),
                )
              ),
              SizedBox(height: 20,),


              /*START SHOPPING button*/
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xff826035),
                  minimumSize: const Size(100, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Center(
                  child: Text(
                    "START SHOPPING",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                ),
                onPressed: () {
                  // TODO: implement registration logic
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeLancher()),
                  );
                },
              ),
            ],
          )),
        ));
  }
}
