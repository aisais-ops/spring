//import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:spring/views/widgets/drawer.dart';
import 'widgets/appBar.dart';

class cart extends StatefulWidget {
  const cart({super.key});

  @override
  State<cart> createState() {
    return _cart();
  }
}

class cartLancher extends StatelessWidget {
  const cartLancher({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: cart(),
    );
  }
}

class _cart extends State<cart> {
  String dropdownValue = 'a';
  String filter = "Default";
  int selectedRadio = 0;
  List<bool> isFavorite = List.generate(10, (index) => false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context, 'CART'),
      drawer: myDrawer(context),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        //child: SingleChildScrollView(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /*Search input*/
            SizedBox(
              height: 40,
              width: 250,
              child: TextFormField(
                textAlign: TextAlign.center,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color.fromARGB(255, 238, 227, 222),
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
                    color: Colors.white70,
                  ),
                ),
              ),
            ),

            /*Sort by ....*/
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
              child: Row(
                children: [
                  /*text sort by */
                  Text(
                    'Sort by ',
                    style: TextStyle(color: Color.fromARGB(255, 141, 110, 99)),
                  ),
                  Text(
                    '$filter',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 141, 110, 99)),
                  ),

                  /*bottom menu filter*/
                  Expanded(
                    child: IconButton(
                      alignment: Alignment.centerRight,
                      icon: const Icon(
                        Icons.add_road_rounded,
                        color: Colors.brown,
                      ),
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return SizedBox(
                                height: 180,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    RadioListTile(
                                      value: 1,
                                      groupValue: selectedRadio,
                                      onChanged: (val) {
                                        setState(() {
                                          selectedRadio = val as int;
                                          filter = "Default";
                                        });
                                        Navigator.pop(context);
                                      },
                                      title: Text('Default'),
                                    ),
                                    RadioListTile(
                                      value: 2,
                                      groupValue: selectedRadio,
                                      onChanged: (val) {
                                        setState(() {
                                          selectedRadio = val as int;
                                          filter = "Newest";
                                        });
                                        Navigator.pop(context);
                                      },
                                      title: Text('Newest'),
                                    ),
                                    RadioListTile(
                                      value: 3,
                                      //controlAffinity: ListTileControlAffinity.trailing,
                                      groupValue: selectedRadio,
                                      onChanged: (val) {
                                        setState(() {
                                          selectedRadio = val as int;
                                          filter = "Latest";
                                        });
                                        Navigator.pop(context);
                                      },
                                      title: Text('Latest'),
                                    ),
                                  ],
                                ),
                              );
                            });
                      },
                    ),
                  )
                ],
              ),
            ),

            /*list item  */
            Expanded(
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) => Container(
                        padding: EdgeInsets.only(bottom: 10),
                        child: ListTile(
                          leading: Image.asset('images/login.jpg'),
                          title: Text('test $index'),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Description'),
                              Text(
                                '\$15.00',
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.brown),
                              )
                            ],
                          ),
                          trailing: IconButton(
                            icon: isFavorite[index]
                                ? const Icon(Icons.favorite,
                                    color: Colors.brown)
                                : const Icon(Icons.favorite_outline_outlined),
                            onPressed: () {
                              // Handle search button press
                              setState(() {
                                isFavorite[index] = !isFavorite[index];
                              });
                            },
                          ),
                        ),
                      )),
            ),

            /*Button ORDER NOW */
            Container(
              //color: Colors.amber,
              height: 70,
              padding: EdgeInsets.all(10),
              width: double.infinity, // Set the desired width
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xff986C40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  "ORDER NOW",
                  style: TextStyle(fontSize: 15, letterSpacing: 1),
                ),
                onPressed: () {
                  // TODO: implement registration logic
                  
                },
              ),
            ),
          ],
        )),
        //),
      ),
    );
  }
}
