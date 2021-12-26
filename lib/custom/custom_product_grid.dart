import 'package:flutter/material.dart';

class CustomProductGrid extends StatelessWidget {
  const CustomProductGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      children: [
        Padding(
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
        ),
        Padding(
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
                const Text("Product",
                    style: TextStyle(fontSize: 20, color: Colors.white)),
              ],
            ),
          ),
        ),
        Padding(
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
                SizedBox(
                  height: 5,
                ),
                const Text("Product",
                    style: TextStyle(fontSize: 18, color: Colors.white)),
              ],
            ),
          ),
        ),
        Padding(
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
                const Text("Product",
                    style: TextStyle(fontSize: 20, color: Colors.white)),
              ],
            ),
          ),
        ),
        Padding(
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
                const Text("Product",
                    style: TextStyle(fontSize: 20, color: Colors.white)),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              alignment: Alignment.center,
              color: Colors.deepOrange,
              height: 100,
              width: 100,
              child: const Text("Product",
                  style: TextStyle(fontSize: 20, color: Colors.white))),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              alignment: Alignment.center,
              color: Colors.deepOrange,
              height: 100,
              width: 100,
              child: const Text("Product",
                  style: TextStyle(fontSize: 20, color: Colors.white))),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              alignment: Alignment.center,
              color: Colors.deepOrange,
              height: 100,
              width: 100,
              child: const Text("Product",
                  style: TextStyle(fontSize: 20, color: Colors.white))),
        ),
      ],
    );
  }
}
