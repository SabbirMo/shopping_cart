import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shopping_cart/Screen/Model/item_model.dart';


List<Product> allProduct = [
  Product(
      id: '1', title: "Groovy Shorts", price: 12, image: 'assets/shorts1.jpg'),
  Product(id: '2', title: "Karati Kit", price: 34, image: 'assets/shorts2.jpg'),
  Product(id: '3', title: "Denim", price: 54, image: 'assets/shorts3.jpg'),
  Product(
      id: '4', title: "Red Backpack", price: 14, image: 'assets/shorts4.jpg'),
  Product(
      id: '5', title: "Drum & Sticks", price: 29, image: 'assets/shorts5.jpg'),
  Product(
      id: '6', title: "Blue Suitcase", price: 44, image: 'assets/shorts6.jpg'),
  Product(
      id: '7', title: "Roller Skates", price: 52, image: 'assets/shorts7.jpg'),
  Product(
      id: '8',
      title: "Electric Guitar",
      price: 79,
      image: 'assets/shorts8.jpg'),
];


final cartProvider = Provider((ref){
  return allProduct;
});