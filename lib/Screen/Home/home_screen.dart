import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_cart/Screen/Cart_provider/cart_provider.dart';
import 'package:shopping_cart/Screen/Provider/provider.dart';
import 'package:shopping_cart/Screen/Shared/cart_icon.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allProduct = ref.watch(cartProvider);
    final cartProduct = ref.watch(cartNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shopping"),
        centerTitle: true,
        actions: const [
          CartIcons(),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: GridView.builder(
          itemCount: allProduct.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 15,
            crossAxisSpacing: 15,
            childAspectRatio: 0.9,
          ),
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.blue.withOpacity(0.5),
              ),
              child: Column(
                children: [
                  Image.asset(allProduct[index].image, width: 50, height: 50),
                  const SizedBox(height: 8),
                  Text(allProduct[index].title),
                  Text("Price: \$ ${allProduct[index].price}"),
                  if (cartProduct.contains(allProduct[index]))
                    TextButton(
                        onPressed: () {
                          ref
                              .read(cartNotifierProvider.notifier)
                              .removeProduct(allProduct[index]);
                        },
                        child: const Text("Remove")),
                  if (!cartProduct.contains(allProduct[index]))
                    TextButton(
                        onPressed: () {
                          ref
                              .read(cartNotifierProvider.notifier)
                              .addProduct(allProduct[index]);
                        },
                        child: const Text("Add to Cart"))
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
