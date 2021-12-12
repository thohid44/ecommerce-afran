import 'package:ecommerce_afran/custom/custom_navbar.dart';
import 'package:ecommerce_afran/pages/cart.dart';
import 'package:ecommerce_afran/pages/favorite.dart';
import 'package:ecommerce_afran/screens/userprofile.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // List index = [Home(), Cart(), Favorite(), UserProfile()];
  // int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Text("CTG E-SHOP"),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart)),
          IconButton(onPressed: () {}, icon: Icon(Icons.person))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text("E-Commere Body here")],
      ),
    //   bottomNavigationBar: BottomNavigationBar(
    //       backgroundColor: Colors.cyan,
    //       selectedItemColor: Colors.white,
    //       onTap: (index) {
    //         setState(() {
    //           index = currentIndex;
    //         });
    //       },
    //       items: const [
    //         BottomNavigationBarItem(icon: Icon(Icons.home)),
    //         BottomNavigationBarItem(icon: Icon(Icons.shopping_cart)),
    //         BottomNavigationBarItem(icon: Icon(Icons.favorite)),
    //         BottomNavigationBarItem(icon: Icon(Icons.person)),
    //       ]),
    // );
  }
}
