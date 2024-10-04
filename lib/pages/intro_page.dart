import 'package:flutter/material.dart';
import 'package:mini_shop/components/my_button.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.shopping_bag,
            size: 75,
            color: Theme.of(context).colorScheme.inversePrimary,
            ),   

        const SizedBox(height: 25,),

        const Text("Mini Shop",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        ),   

        const SizedBox(height: 25,),

        Text("Premium Quality Products",
        style: TextStyle(
          color: Theme.of(context).colorScheme.inversePrimary,
        ),), 

        MyButton(
          onTap: () => Navigator.pushNamed(context, "/shop_page"),
           child: const Icon(Icons.home,
           color: Colors.black,) 
           ), 
          ],
        ),
      ),
    );
  }
}