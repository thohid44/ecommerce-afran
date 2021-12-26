import 'package:ecommerce_afran/custom/custom_category.dart';
import 'package:ecommerce_afran/custom/custom_product_grid.dart';
import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  final TextEditingController _search = TextEditingController();

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        title: const Text("CTG E-SHOP"),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.shopping_cart,
                color: Colors.red,
              )),
          IconButton(onPressed: () {}, icon: Icon(Icons.person))
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: SizedBox(
              height: 60,
              child: TextFormField(
                controller: _search,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.search, color: Colors.red),
                    border: OutlineInputBorder()),
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Text("Category",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              )),
          const SizedBox(height: 10),
          const SizedBox(
            height: 120,
            child: CustomCategory(),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
