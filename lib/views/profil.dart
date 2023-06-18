//import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:spring/views/widgets/drawer.dart';
import 'widgets/appBar.dart';

class ProfilLancher extends StatelessWidget {
  const ProfilLancher({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Profil(),
    );
  }
}

class Profil extends StatefulWidget {
  const Profil({super.key});

  @override
  State<Profil> createState() {
    return _Profil();
  }
}

class _Profil extends State<Profil> {
  bool _isEditing = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context,'PROFIL'),
      drawer: myDrawer(context),
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 20,bottom: 30),
        child: SingleChildScrollView(
          child: Center(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*store image*/
                Container(
                    margin: const EdgeInsets.all(10),
                    alignment: Alignment.center,
                    child: Image.asset(
                      'images/logo.png',
                      width: 90,
                      height: 90,
                    )
                ),

                /*Personal information text and edit button*/
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Personal',
                      style: TextStyle(
                          fontSize: 25.0,
                          color: Colors.brown,
                          fontWeight: FontWeight.w700),
                    ),
                    /*edit button */
                    IconButton(
                        onPressed: () {
                          // handle button press
                          setState(() {
                            _isEditing = !_isEditing;
                          });
                        },
                        icon: const Icon(
                          Icons.edit_note_outlined
                        ),
                        color: Color(0xff826035)
                      )
                  ],
                ),
                const Text(
                  'informations',
                  style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.brown,
                      fontWeight: FontWeight.w700),
                ),

                /*white space*/
                const SizedBox(height: 10),

                /*Username input*/
                TextFormField(
                  enabled: _isEditing,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    //labelText: 'Username',
                    //labelStyle: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),
                    hintText: 'Username',
                    hintStyle: TextStyle(color: Colors.brown),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 141, 110, 99),
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                /*Email input*/
                TextFormField(
                  enabled: _isEditing,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    //labelText: 'Email',
                    //labelStyle: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),
                    hintText: 'Email',
                    hintStyle: TextStyle(color: Colors.brown),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 141, 110, 99),
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                /*Phone input*/
                TextFormField(
                  enabled: _isEditing,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    //labelText: 'Email',
                    //labelStyle: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),
                    hintText: 'Phone',
                    hintStyle: TextStyle(color: Colors.brown),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 141, 110, 99),
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                /*Adress input*/
                TextFormField(
                  enabled: _isEditing,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    //labelText: 'Email',
                    //labelStyle: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),
                    hintText: 'Adress',
                    hintStyle: TextStyle(color: Colors.brown),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 141, 110, 99),
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                /*Delete account button*/
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
                      "DELETE ACCOUNT",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                  onPressed: () {
                    // TODO: implement registration logic
                  },
                ),
              ],
            
          )),
        ),
      ),
    );
  }
}
