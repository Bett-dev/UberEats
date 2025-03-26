import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:urban_eats/constants/const.dart';
import 'package:urban_eats/provider/cart_provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      backgroundColor: kBgColor,
      body: ListView.builder(
        itemCount: cartProvider.cartCount,
        itemBuilder:
            (context, index) => Text(cartProvider.cartItems[index].name),
      ),
    );
  }
}
