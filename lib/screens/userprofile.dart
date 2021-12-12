import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _address = TextEditingController();

  final TextEditingController _phone = TextEditingController();

  List<String> gender = ['Male', 'Female', 'Not Define'];

  userProfileInfo() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var currentuser = _auth.currentUser;

    CollectionReference _collectRef =
        FirebaseFirestore.instance.collection('user-profile');
    return _collectRef.doc(currentuser!.email).set({
      "name": _name.text,
      "address": _address.text,
      "phone": _phone.text,
    }).then((value) {
      Fluttertoast.showToast(msg: "Successfully Registered");
    }).catchError((error) {
      Fluttertoast.showToast(msg: "$error");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("User Profile Data")),
      body: Column(
        children: [
          TextFormField(
            controller: _name,
            decoration: const InputDecoration(
                prefixIcon: Icon(Icons.mail, color: Colors.blue, size: 35),
                hintText: "Enter Your Name",
                hintStyle: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                )),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: _address,
            decoration: const InputDecoration(
                prefixIcon: Icon(Icons.mail, color: Colors.blue, size: 35),
                hintText: "Enter Your Address",
                hintStyle: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                )),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: _phone,
            decoration: const InputDecoration(
                prefixIcon: Icon(Icons.mail, color: Colors.blue, size: 35),
                hintText: "Enter Your Mobile",
                hintStyle: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                )),
          ),
          const SizedBox(
            height: 10,
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
                    userProfileInfo();
                  },
                  child: const Text("Register",
                      style: TextStyle(
                          fontSize: 23,
                          color: Colors.deepOrange,
                          fontWeight: FontWeight.bold))),
            ),
          ),
        ],
      ),
    );
  }
}
