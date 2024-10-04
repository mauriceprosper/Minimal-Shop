import 'package:flutter/material.dart';
import 'package:mini_shop/components/my_Drawer.dart';
import 'package:mini_shop/models/product.dart';
import 'package:provider/provider.dart';

import '../components/my_button.dart';
import '../models/shop.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  void removeItemFromCart(BuildContext context, Product product){
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: const Text("Sapa Catch You?"),
          actions: [
            MaterialButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("I no fit!"),
              ),

              MaterialButton(
              onPressed: () {

                Navigator.pop(context);

                context.read<Shop>().addToCart(product);
              },
              child: const Text("Add One More!"),
              )
          ],
        ),
      );
  }

  void payButtonPressed(BuildContext context){
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        content: Text("User Wants to Pay!"),
            ));
  }

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<Shop>().cart;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Your Cart"),
      ),
      drawer: const MyDrawer(),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        children: [
          Expanded(
            child: cart.isEmpty ?
            const Center(child: Text("Your Cart is Empty")) : ListView.builder(
              itemCount: cart.length,
              itemBuilder: (context, index){
              final item = cart[index];

              return ListTile(
                title: Text(item.name),
                subtitle: Text(item.price.toStringAsFixed(2)),
                trailing: IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () => removeItemFromCart(context, item), ),
              );
            },),),
            MyButton(
              onTap: () => payButtonPressed(context),
              child: const Text("Pay Now!"))
        ],
      ),
    );
  }
}