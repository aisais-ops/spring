//import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:spring/views/widgets/drawer.dart';
import 'widgets/appBar.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  State<ContactUs> createState() {
    return _ContactUs();
  }
}

class ContactUsLancher extends StatelessWidget {
  const ContactUsLancher({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ContactUs(),
    );
  }
}

class _ContactUs extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context,'CONTACT'),
      drawer: myDrawer(context),
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30,top: 20,bottom: 30),
        child: SingleChildScrollView(
          child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /*Contact us text*/
                  const Center(
                    child: Text(
                      'Contact us',
                      style: TextStyle(
                          fontSize: 50.0,
                          color: Colors.brown,
                          fontWeight: FontWeight.w600),
                    ),
                  ),

                  /*You are always welcome text*/
                  Center(
                    child: Container(
                      width: 200,
                      child:  const Text(
                      'You are always welcome to get in touch with us',
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Color.fromARGB(255, 155, 120, 24),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    ),
                  ),

                  /*white space*/
                  const SizedBox(height: 100),             

                  /*Email input*/
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
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
                  const SizedBox(height: 30),   
                  
                  /*Message input*/
                  TextFormField(
                    keyboardType: TextInputType.multiline,
                    minLines: 4,
                    maxLines: null,
                    decoration: const InputDecoration(
                      hintText: 'Your message here...',
                      hintStyle: TextStyle(color: Colors.brown),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                              color: Colors.brown,
                              width: 2.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 141, 110, 99),
                          width: 2.0,
                        ),
                      ),
                      
                    ),
                  ),
            
                  const SizedBox(height: 30),   

                  /*Submit button*/
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
                        "Submit",
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

                  /*Or text*/
                  const Padding(
                    padding: EdgeInsets.all(30.0),
                    child: Center(
                      child: Text(
                        'OR',
                        style: TextStyle(
                            fontSize: 20.0,
                            letterSpacing: 1,
                            color: Colors.brown,
                        ),
                      ),
                    ),
                  ),

                  /*whatsapp button*/
                  GestureDetector(
                    onTap: () {
                      // Handle image press
                    },
                    child: const Center(
                      child: Image(
                        image: AssetImage('images/logo.png'),
                        width: 80,
                        height: 80,
                      ),
                    )
                  )

                ],
              
              )
          ),
        ),
      ),
    );
  }
}
