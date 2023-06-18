import 'package:flutter/material.dart';
import 'package:spring/views/login.dart';
import 'package:spring/views/widgets/topBar.dart';
import 'createStore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class RegisterLancher extends StatelessWidget {
  const RegisterLancher({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Register(),
    );
  }
}

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() {
    return _Register();
  }
}

class _Register extends State<Register> {
  final auth = FirebaseAuth.instance;
  late String email;
  late String password;

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /*top bar create store*/
            const TopBar(),
            /*Create new Account text*/
            Container(
              padding: const EdgeInsets.only(
                  top: 20, left: 30, right: 30, bottom: 30),
              child: Column(
                children: [
                  const Text(
                    'Create new Account',
                    style: TextStyle(
                        fontSize: 50.0,
                        color: Color(0xff986C40),
                        fontWeight: FontWeight.w500),
                  ),

                  /*Already Registered text*/
                  Container(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'Already Registered? Log in here.',
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Color(0xffba9964),
                      ),
                    ),
                  ),

                  /*white space*/
                  const SizedBox(height: 50),

                  /*Username input*/
                  TextFormField(
                    onChanged: (value) {},
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                      //labelText: 'Username',
                      //labelStyle: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),
                      hintText: 'Username',
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

                  /*Email input*/
                  TextFormField(
                    onChanged: (value) {
                      email = value;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      //labelText: 'Email',
                      //labelStyle: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),
                      hintText: 'Email',
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

                  /*Phone input*/
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      //labelText: 'Email',
                      //labelStyle: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),
                      hintText: 'Phone',
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
                    onChanged: (value) {
                      password = value;
                    },
                    obscureText: true,
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

                  /*Register button*/
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
                        "REGISTER",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                    onPressed: () async {
                      // TODO: implement registration logic
                      try {
                        var user = await auth
                            .createUserWithEmailAndPassword(
                                email: email, password: password)
                            .then((value) => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginLancher(),
                                )));
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          print('The password provided is too weak.');
                        } else if (e.code == 'email-already-in-use') {
                          print('The account already exists for that email.');
                        }
                      } catch (e) {
                        print(e);
                      }
                    },
                  ),

                  /*test button*/
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
                        "test",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                    onPressed: () async {
                      // TODO: implement registration logic
                      UserCredential user = await signInWithGoogle();
                    },
                  ),

                  /*Or join with text*/
                  const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Center(
                      child: Text(
                        'OR JOIN WITH',
                        style: TextStyle(
                          letterSpacing: 1,
                          color: Colors.brown,
                        ),
                      ),
                    ),
                  ),

                  /*google and facebook button*/
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      /*google button */
                      GestureDetector(
                        onTap: () async{
                          // Handle image press
                          UserCredential user = await signInWithGoogle();
                          
                        },
                        child: const Image(
                          image: AssetImage('images/logo.png'),
                          width: 50,
                          height: 50,
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),

                      /*facebook button */
                      GestureDetector(
                        onTap: () {
                          // Handle image press
                        },
                        child: const Image(
                          image: AssetImage('images/logo.png'),
                          width: 50,
                          height: 50,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  /*create store text */
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        // Handle click event
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CreateStoreLancher()),
                        );
                      },
                      child: const Text(
                        'CREATE STORE',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            color: Color(0xff826035)),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}
