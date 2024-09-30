import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_cart/Screen/Cart/shopping_cart.dart';
import 'package:shopping_cart/Screen/Cart_provider/cart_provider.dart';

class CartIcons extends ConsumerWidget {
  const CartIcons({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final totalNumber = ref.watch(cartNotifierProvider).length;
    return SingleChildScrollView(
      child: Stack(
        children: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ShoppingCart()),
              );
            },
            icon: const Icon(Icons.shopping_cart_outlined),
          ),
          Positioned(
            top: 5,
            left: 5,
            child: Container(
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blue,
              ),
              child: Center(
                child: Text(
                  totalNumber.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
