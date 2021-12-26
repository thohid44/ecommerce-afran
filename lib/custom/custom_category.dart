import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CustomCategory extends StatefulWidget {
  const CustomCategory({Key? key}) : super(key: key);

  @override
  State<CustomCategory> createState() => _CustomCategoryState();
}

class _CustomCategoryState extends State<CustomCategory> {
  List _products = [];
  var _firestoreInstance = FirebaseFirestore.instance;
  fetchCategory() async {
    QuerySnapshot qn = await _firestoreInstance.collection("products").get();
    setState(() {
      for (int i = 0; i < qn.docs.length; i++) {}
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 4,
      itemBuilder: (BuildContext context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            color: Colors.deepOrange,
            height: 120,
            width: 100,
            child: Column(
              children: [
                Container(
                    child: Image.network(
                        'https://firebasestorage.googleapis.com/v0/b/ecommerce-afran.appspot.com/o/headphone.jpg?alt=media&token=4083b6dc-e7b7-45f5-bcb5-b717d5576c0a')),
                const SizedBox(
                  height: 7,
                ),
                const Text("HeadPhone",
                    style: TextStyle(fontSize: 16, color: Colors.white)),
              ],
            ),
          ),
        );
      },
    );
  }
}
