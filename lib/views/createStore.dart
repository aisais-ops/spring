
import 'package:flutter/material.dart';
import 'package:spring/models/utilisateur.dart';
import 'package:spring/routes/routes.dart';
import 'package:spring/viewmodels/authViewModel.dart';
import 'package:spring/views/login.dart';

class CreateStoreLancher extends StatelessWidget {
  const CreateStoreLancher({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: CreateStore(),
      routes: Routes.getRoutes(),
    );
  }
}

class CreateStore extends StatefulWidget {
  const CreateStore({super.key});

  @override
  State<CreateStore> createState() {
    return _CreateStore();
  }
}

class _CreateStore extends State<CreateStore> {
  List<String> sellsList = [
        'OIL',
        'CREAM & MASK',
        'EXTRA CARE',
        'SHAMPOO & BODY LOTION',
        'MAKEUP',
        'NUTRITIONAL',
        'SUPPLEMENT',
        'HERBS',
  ];
    
  List<String>? selectedsells = [];
  final AuthViewModel authViewModel = AuthViewModel();
  //late String password;
  final Utilisateur utilisateur = Utilisateur();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:Scaffold(
      body: /*Padding(
        padding: const EdgeInsets.only(left: 30,right: 30),
        child: */SingleChildScrollView(

          /*child: Center(*/
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  /*top bar create store*/
                  Container(
                    height: 45,
                    color: const Color(0xffe4cdaa),
                    padding: EdgeInsets.zero,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Welcome to',
                          style: TextStyle(
                            color: Color(0xff906520)
                          ),
                        ),
                        const SizedBox(width: 10,),
                        Image.asset('images/logo.png',width: 40,height: 40,),
                        const SizedBox(width: 10,),
                        const Text(
                          'family',
                           style: TextStyle(
                             color: Color(0xff906520)
                           ),
                        ),
                        
                      ],
                    ),
                  ),
             
                  Padding(
                    padding: const EdgeInsets.only(top:10,left: 30,right: 30,bottom: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /*Create new store text*/
                        Container(
                          width: 200,
                          child: const Text(
                            'Create your store',
                            style: TextStyle(
                                fontSize: 35,
                                color: Color(0xff986C40),
                                fontWeight: FontWeight.bold),
                          ),
                        ),

                        /*and let's bring spring together ! text*/
                        const Text(
                          "and let's bring spring together !",
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Color(0xffba9964),
                          ),
                        ),

                        /*store image*/
                        Container(
                          margin: const EdgeInsets.all(10),
                          alignment: Alignment.center,
                          child: Image.asset(
                            'images/logo.png',
                            width: 80,
                            height: 80,
                          )
                        ),

                        /*Business name input*/
                        TextFormField(
                          keyboardType: TextInputType.name,
                          onChanged: (value) {
                            utilisateur.username = value;
                          },
                          decoration: const InputDecoration(
                            //labelText: 'Username',
                            //labelStyle: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),
                            hintText: 'Business name',
                            hintStyle: TextStyle(color: Color(0xff986C40)),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xff986C40),
                                width: 2.0,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15), 

                        /*Business Email input*/
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (value) {
                            utilisateur.email = value;
                          },
                          decoration: const InputDecoration(
                            //labelText: 'Email',
                            //labelStyle: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),
                            hintText: 'Business Email',
                            hintStyle: TextStyle(color: Color(0xff986C40)),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xff986C40),
                                width: 2.0,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15), 

                        /*Business Phone input*/
                        TextFormField(
                          keyboardType: TextInputType.phone,
                          onChanged: (value) {
                            utilisateur.tel = value;
                          },
                          decoration: const InputDecoration(
                            //labelText: 'Email',
                            //labelStyle: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),
                            hintText: 'Business Phone',
                            hintStyle: TextStyle(color: Color(0xff986C40)), 
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xff986C40),
                                width: 2.0,
                              ),
                            ),
                            ),
                        ),
                        const SizedBox(height: 15), 
                        
                        /*Password input*/
                        TextFormField(
                          obscureText: true,
                          onChanged: (value) {
                            utilisateur.password = value;
                          },
                          decoration: const InputDecoration(
                            //labelText: 'Email',
                            //labelStyle: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),
                            hintText: 'Password',
                            hintStyle: TextStyle(color: Color(0xff986C40)),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xff986C40),
                                width: 2.0,
                              ),
                            ),
                          ),
                        ),    
                        const SizedBox(height: 30),
                        
                        /*what do you sell text  */
                        const Text(
                            'What do you sell?',
                            style: TextStyle(
                                fontSize: 16,
                                color: Color(0xff826035),
                                fontWeight: FontWeight.bold),
                          ),
                        const SizedBox(height: 20),

                        /*multi choice what do you sell */
                        Wrap(
                          alignment: WrapAlignment.spaceBetween,
                          children: sellsList.map(
                            (sell) {
                              bool isSelected = false;
                              if (selectedsells!.contains(sell)) {
                                isSelected = true;
                              }
                              return GestureDetector(
                                onTap: () {
                                  if (!selectedsells!.contains(sell)) {
                                    if (selectedsells!.length < 5) {
                                      selectedsells!.add(sell);
                                      setState(() {});
                                    }
                                  } else {
                                    selectedsells!
                                        .removeWhere((element) => element == sell);
                                    setState(() {});
                                  }
                                },
                                child: Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 4,
                                         vertical: 4
                                    ),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5,
                                          horizontal: 12
                                      ),
                                      decoration: BoxDecoration(
                                        color: isSelected ? const Color(0xffba9964):Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: isSelected
                                                ? const Color(0xffba9964)
                                                : Colors.grey,
                                            width: 2
                                        )
                                      ),
                                      child: Text(
                                        sell,
                                        style: TextStyle(
                                            color:isSelected ? Colors.white : Colors.black,
                                            fontSize: 14
                                        ),
                                      ),
                                    )
                                ),
                              );
                            },
                          ).toList(),
                        ),
                        const SizedBox(height: 30),
                        
                        /*Create button*/
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: const Color(0xff986C40),
                            minimumSize: const Size(100, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              "Create",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                              ),
                            ),
                          ),
                          onPressed: () {
                            // TODO: implement registration logic
                            utilisateur.role = "vendeur";
                            authViewModel.signUp(utilisateur);
                            /* Navigator.push(
                                context,
                               MaterialPageRoute(
                                  builder: (context) => const LoginLancher(),
                                ));*/
                            Navigator.pushReplacementNamed(context,'loginLancher');
                          },
                        ),
          
                      ],
                    ),
                  ),

                  
                ],
              )
          //),
        ),
      //),
    ),
      );
  }
}
