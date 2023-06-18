//import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:spring/views/categorie.dart';
import 'package:spring/views/widgets/topBar.dart';
import 'widgets/appBar.dart';
import 'widgets/drawer.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomeLancher extends StatelessWidget {
  const HomeLancher({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() {
    return _Home();
  }
}

class _Home extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: //Stack(
          //children: [
          Scaffold(
        //appBar: myAppBar(context,'HOME'),
        drawer: myDrawer(context),
        body: Column(
          children: <Widget>[
            /*top banare welcome to spring family*/
            const TopBar(),

            /*tool bar create store*/
            PreferredSize(
              preferredSize: const Size.fromHeight(50),
              child: myAppBar(context, 'HOME') as Widget,
            ),

            Expanded(
              child: SingleChildScrollView(
                child: Column(children: [
                  /*top part home */
                  SizedBox(
                    height: 300,
                    width: double.infinity,
                    child: Stack(
                      children: [
                        Container(
                          height: 240,
                          width: double.infinity,
                          padding: const EdgeInsets.only(
                            top: 30,
                            right: 30,
                            left: 30,
                          ),
                          /*background image home */
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 32, 18, 13),
                              image: DecorationImage(
                                image: AssetImage(
                                  'images/login.jpg',
                                ),
                                fit: BoxFit.cover,
                                opacity: 0.8,
                              )),

                          /*top part home text*/
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              /*Search input*/
                              SizedBox(
                                height: 30,
                                child: TextFormField(
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white30,
                                    contentPadding: const EdgeInsets.only(
                                      top: 10,
                                      right: 10,
                                      left: 10,
                                    ),
                                    hintText: 'Product, Store, Etc...',
                                    hintStyle:
                                        const TextStyle(color: Colors.brown),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: BorderSide.none),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: const BorderSide(
                                        color:
                                            Color.fromARGB(255, 141, 110, 99),
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
                              
                              const SizedBox(height: 35),
                              SizedBox(
                                width: 230,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    /*New collection text*/
                                    Text(
                                      'New Collection',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25,
                                      ),
                                    ),
                                    const SizedBox(height: 15),
                                    /*Description text*/
                                    Text(
                                      'This body of work is all about the layering of colors and the interaction between edges, lines, and shadows.',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned.fill(
                          top: 195,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              /*For you button */
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      // Handle image press
                                    },
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.blue,
                                      ),
                                      width: 50,
                                      height: 50,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(50),
                                        child: Image.asset(
                                          'images/login.jpg',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                      height:
                                          8), // Add some space between the image and text
                                  const Text(
                                    'FOR YOU',
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Color(0xff906520),
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 10,
                              ),

                              /*Body button */
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      // Handle image press
                                    },
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.blue,
                                      ),
                                      width: 50,
                                      height: 50,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(50),
                                        child: Image.asset(
                                          'images/login.jpg',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                      height:
                                          8), // Add some space between the image and text
                                  const Text(
                                    'BODY',
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Color(0xff906520),
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 10,
                              ),

                              /*Essentials button*/
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      // Handle image press
                                    },
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.blue,
                                      ),
                                      width: 50,
                                      height: 50,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(50),
                                        child: Image.asset(
                                          'images/login.jpg',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                      height:
                                          8), // Add some space between the image and text
                                  const Text(
                                    'ESSENTIALS',
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Color(0xff906520),
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 10,
                              ),

                              /*Skin care button */
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      // Handle image press
                                    },
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.blue,
                                      ),
                                      width: 50,
                                      height: 50,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(50),
                                        child: Image.asset(
                                          'images/login.jpg',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                      height:
                                          8), // Add some space between the image and text
                                  const Text(
                                    'SKIN CARE',
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Color(0xff906520),
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 10,
                              ),

                              /*More button */
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      // Handle image press
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => CategorieLancher()),
                                      );
                                    },
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color.fromARGB(255, 195, 137, 118),
                                      ),
                                      width: 50,
                                      height: 50,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(50),
                                        child: Icon(Icons.more_horiz_outlined,color: Colors.white,size: 40,),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                      height:
                                          8), // Add some space between the image and text
                                  const Text(
                                    'MORE',
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Color(0xff906520),
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),

                  /* group buttons
                        Positioned(
                          left: 0,
                          right: 0,
                          top: 715,
                          
                          child:Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              /*For you button */
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      // Handle image press
                                    },
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.blue,
                                      ),
                                      width: 50,
                                      height: 50,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(50),
                                        child: Image.asset(
                                          'images/login.jpg',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                      height:
                                          8), // Add some space between the image and text
                                  const Text(
                                    'FOR YOU',
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Color(0xff906520),
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 10,
                              ),

                              /*Body button */
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      // Handle image press
                                    },
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.blue,
                                      ),
                                      width: 50,
                                      height: 50,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(50),
                                        child: Image.asset(
                                          'images/login.jpg',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                      height:
                                          8), // Add some space between the image and text
                                  const Text(
                                    'BODY',
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Color(0xff906520),
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 10,
                              ),

                              /*Essentials button*/
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      // Handle image press
                                    },
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.blue,
                                      ),
                                      width: 50,
                                      height: 50,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(50),
                                        child: Image.asset(
                                          'images/login.jpg',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                      height:
                                          8), // Add some space between the image and text
                                  const Text(
                                    'ESSENTIALS',
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Color(0xff906520),
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 10,
                              ),

                              /*Skin care button */
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      // Handle image press
                                    },
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.blue,
                                      ),
                                      width: 50,
                                      height: 50,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(50),
                                        child: Image.asset(
                                          'images/login.jpg',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                      height:
                                          8), // Add some space between the image and text
                                  const Text(
                                    'SKIN CARE',
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Color(0xff906520),
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 10,
                              ),

                              /*More button */
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      // Handle image press
                                    },
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.blue,
                                      ),
                                      width: 50,
                                      height: 50,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(50),
                                        child: Image.asset(
                                          'images/login.jpg',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                      height:
                                          8
                                  ), // Add some space between the image and text
                                  const Text(
                                    'MORE',
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Color(0xff906520),
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                        ), 
                        */

                  //Padding(
                  //padding: const EdgeInsets.only(top: 50),
                  /*child:*/ MasonryGridView.builder(
                    shrinkWrap: true,
                    itemCount: 4,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (context, index) {
                      // Customize each item based on the index
                      // You can use the index to determine the specific customization for each item
                      // For example, you can set different images, text, or styles for each item

                      String imagePath = 'images/product$index.png';
                      String itemName = '  Product $index    $index\$';

                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            // Handle item press
                          },
                          child: Column(
                            children: [
                              Image.asset(imagePath),
                              
                              Container(
                                  width: double.infinity,
                                  alignment: Alignment.centerLeft,
                                  height: 30,
                                  color: Colors.grey[400],
                                  child: Text(
                                    itemName,
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.brown[400],
                                        fontWeight: FontWeight.w600),
                                  )),
                            ],
                          ),
                        ),
                      );
                    },
                  ),

                  /*GridView.count(
                                crossAxisCount: 2,
                                crossAxisSpacing: 5,
                                mainAxisSpacing: 5,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                children: [
                                  Container(
                                    height: 170,
                                    width: 50 ,
                                    color: Colors.amber,
                                  ),
                                  Container(
                                    height: 170,
                                    width: 50,
                                    color: Colors.amber,
                                  ),
                                  Container(
                                    height: 170,
                                    width: 50,
                                    color: Colors.amber,
                                  ),
                                  Container(
                                    height: 170,
                                    width: 50,
                                    color: Colors.amber,
                                  ),
                                  Container(
                                    height: 170,
                                    width: 50,
                                    color: Colors.amber,
                                  ),
                                  Container(
                                    height: 170,
                                    width: 50,
                                    color: Colors.amber,
                                  )
                                ],
                              ),*/
                  //),
                ]),
              ),
            ),

            // Rest of your widgets
          ],
        ),

        /* group buttons 
            Positioned(
              left: 0,
              right: 0,
              top: 315,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  /*For you button */
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Handle image press
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blue,
                          ),
                          width: 50,
                          height: 50,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.asset(
                              'images/login.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                          height:
                              8), // Add some space between the image and text
                      const Text(
                        'FOR YOU',
                        style: TextStyle(
                          fontSize: 10,
                          color: Color(0xff906520),
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),

                  /*Body button */
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Handle image press
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blue,
                          ),
                          width: 50,
                          height: 50,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.asset(
                              'images/login.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                          height:
                              8), // Add some space between the image and text
                      const Text(
                        'BODY',
                        style: TextStyle(
                          fontSize: 10,
                          color: Color(0xff906520),
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),

                  /*Essentials button*/
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Handle image press
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blue,
                          ),
                          width: 50,
                          height: 50,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.asset(
                              'images/login.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                          height:
                              8), // Add some space between the image and text
                      const Text(
                        'ESSENTIALS',
                        style: TextStyle(
                          fontSize: 10,
                          color: Color(0xff906520),
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),

                  /*Skin care button */
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Handle image press
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blue,
                          ),
                          width: 50,
                          height: 50,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.asset(
                              'images/login.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                          height:
                              8), // Add some space between the image and text
                      const Text(
                        'SKIN CARE',
                        style: TextStyle(
                          fontSize: 10,
                          color: Color(0xff906520),
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),

                  /*More button */
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Handle image press
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blue,
                          ),
                          width: 50,
                          height: 50,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.asset(
                              'images/login.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                          height:
                              8), // Add some space between the image and text
                      const Text(
                        'MORE',
                        style: TextStyle(
                          fontSize: 10,
                          color: Color(0xff906520),
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ),
            Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MasonryGridView.builder(
                      itemCount: 6,
                      gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          color: Colors.amber,
                          height: 200,
                        ),
                      ),
                    ),
                  ),
                ),
            */
      ),

      //],
      //),
    );
    ;
  }
}
