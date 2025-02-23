import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mini_shop/components/my_Drawer.dart';
import 'package:mini_shop/components/my_product_tile.dart';
import 'package:provider/provider.dart';

import '../models/shop.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {

    final products = context.watch<Shop>().shop;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Catalogue"),
        actions: [
          IconButton(onPressed: ()=> Navigator.pushNamed(context, "/cart_page"), icon: const Icon(Icons.shopping_bag_outlined))
        ],
        ),
        drawer: const MyDrawer(),

        body: ListView(
          children: [

            const SizedBox(
              height: 25,
            ),

            Center(
              child: Text(
                "Pick from a list of selected Premium Products",
                style: TextStyle(
                  backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                ),)),


            SizedBox(
          height: 550,
          child: ListView.builder(
            itemCount: products.length,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.all(15),
            itemBuilder: (context, index) {
              final product = products[index];
          
              return MyProductTile(product: product);
          }),
        ),
          ],
        )
    );
  }
}