
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shopping_cart/Screen/Model/item_model.dart';

part 'cart_provider.g.dart';

@riverpod
class CartNotifier extends _$CartNotifier{
  @override
  Set<Product> build() {
    return {};
  }

  void addProduct(Product product){
    if(!state.contains(product)){
      state = {...state, product};
    }
  }

  void removeProduct(Product product){
    if(state.contains(product)){
      state = state.where((e) => e.id != product.id).toSet();
    }
  }

}

@riverpod
int cartTotal(ref){
  final cartProduct = ref.watch(cartNotifierProvider);
  int total = 0;

  for (Product product in cartProduct) {
    total += product.price;
  }
  return total;
}

