import 'package:ecommerce_afran/pages/home.dart';
import 'package:ecommerce_afran/screens/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  logIn() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: _email.text, password: _password.text);
      var authCredential = userCredential.user;

      if (authCredential!.uid.isNotEmpty) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Home()));
      } else {
        Fluttertoast.showToast(
            msg: "This is Center Short Toast",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Fluttertoast.showToast(msg: ' user found for that email.');
      } else if (e.code == 'wrong-password') {
        Fluttertoast.showToast(msg: 'Wrong password provided for that user.');
      }
    } catch (e) {
      Fluttertoast.showToast(msg: '$e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.deepOrange,
        body: Column(children: [
          SizedBox(
            height: 200,
          ),
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50)),
              ),
              width: double.infinity,
              height: 300,
              child: Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: _email,
                      decoration: const InputDecoration(
                          prefixIcon:
                              Icon(Icons.mail, color: Colors.blue, size: 35),
                          hintText: "Enter your email",
                          hintStyle: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _password,
                      obscureText: true,
                      decoration: const InputDecoration(
                          prefixIcon:
                              Icon(Icons.lock, color: Colors.blue, size: 35),
                          hintText: "Enter your email",
                          hintStyle: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 60,
              width: double.infinity,
              color: Colors.white,
              child: TextButton(
                  onPressed: () {
                    logIn();
                  },
                  child: const Text("Login",
                      style: TextStyle(
                          fontSize: 23,
                          color: Colors.deepOrange,
                          fontWeight: FontWeight.bold))),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => Register()));
            },
            child: const Text("Have you no Account?, Register Here",
                style: TextStyle(color: Colors.white, fontSize: 20)),
          )
        ]),
      ),
    );
  }
}
