
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_cart/Screen/Cart_provider/cart_provider.dart';

class ShoppingCart extends ConsumerWidget {
  const ShoppingCart({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartProduct = ref.watch(cartNotifierProvider);
    final totalPrice = ref.watch(cartTotalProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Cart"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Column(
                children: cartProduct.map((product) {
                  return Card(
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Image.asset(product.image, width: 50, height: 50,),
                              const SizedBox(width: 8),
                              Text("${product.title}..."),
                              const Expanded(child: SizedBox()),
                              Text("\$ ${product.price}"),
                            ],
                          ),
                          TextButton(onPressed: (){
                            ref.read(cartNotifierProvider.notifier).removeProduct(product);
                          }, child: const Text("Remove"))
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
              Text("Price: \$${totalPrice}", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),)
            ],
          ),
        ),
      ),
      
    );
  }
}