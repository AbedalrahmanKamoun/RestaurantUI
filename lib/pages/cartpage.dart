import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Icon(
        Icons.shopping_cart,
        size: 46.0,
        color: Colors.deepOrangeAccent,
      ),
    );
  }
}
