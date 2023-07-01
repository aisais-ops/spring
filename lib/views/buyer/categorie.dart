//import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spring/routes/routes.dart';
import 'package:spring/views/buyer/widgets/drawer.dart';
import '../widgets/appBar.dart';

class Categorie extends StatefulWidget {
  const Categorie({super.key});

  @override
  State<Categorie> createState() {
    return _Categorie();
  }
}

class CategorieLancher extends StatelessWidget {
  const CategorieLancher({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Categorie(),
      routes: Routes.getRoutes(),
    );
  }
}

class _Categorie extends State<Categorie> {
   String? userType;

  @override
  void initState() {
    super.initState();
    loadUserType();
  }

  Future<void> loadUserType() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userType = prefs.getString('typeUser')==null?"Geust":prefs.getString('typeUser');
    setState(() {});
  }
  List<bool> isFavorite = List.generate(10, (index) => false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: myAppBar(context, 'Categorie',true),
        drawer: myDrawer(context,userType=="Geust"?false:true),
        body: //Padding(
            //padding: const EdgeInsets.all(10),
            //child: SingleChildScrollView(
            //child: Center(
            /*child:*/ Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30.0, bottom: 20, top: 15),
              child: Text(
                'My categories :',
                style: TextStyle(color: Colors.brown),
              ),
            ),
            /*list item  */
            Expanded(
              child: ListView.builder(
                
                  itemCount: 10,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      alignment: Alignment.centerLeft,
                          height: 150,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('images/product0.png'), // Replace with your image path
                              fit: BoxFit.cover,
                            ),
                          ),
                          padding: EdgeInsets.only(bottom: 10 ,top: 10),
                          child: ListTile(
                            title: Text(
                              'test $index',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 25
                              ),
                            ),
                            subtitle: Container(
                              decoration: BoxDecoration(
                                color: Colors.white
                              ),
                              child: Text(
                                '120 Product',
                                style: TextStyle(
                                  color: Colors.black,
                                         
                                ),
                              ),
                            ),
                            
                            trailing: IconButton(
                              icon: const Icon(Icons.add,color: Colors.brown,),
                              onPressed: () {
                                // Handle search button press
                                
                              },
                            ),
                          ),
                        ),
                  )),
            ),
          ],
        )
        //),
        //),
        //),
        );
  }
}
