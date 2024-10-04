import 'package:flutter/material.dart';
import 'package:mini_shop/models/product.dart';

class Shop extends ChangeNotifier {
  final List<Product> _shop = [
    Product(name: "Glasses",
    price: 9.99,
    description: "description of Products",
    imagePath: "assets/glasses.png",
    ),

    Product(name: "Hoodie",
    price: 9.99,
    description: "description of Products",
    imagePath: "assets/hoodie.png",
    ),

    Product(name: "Shoe",
    price: 9.99,
    description: "description of Products",
    imagePath: "assets/shoe.png",
    ),

    Product(name: "Watch",
    price: 9.99,
    description: "description of Products",
    imagePath: "assets/watch.png",
    ),
  ];

  final List<Product> _cart = [];

  List<Product> get shop => _shop;

  List<Product> get cart => _cart;

  void addToCart(Product item){
    _cart.add(item);
    notifyListeners();
  }

  void removeFromCart(Product item){
    _cart.remove(item);
    notifyListeners();
  }
}