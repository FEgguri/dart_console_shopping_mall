import 'package:shopping_mall_dart/models/model_Product.dart';

class Cart {
  List<Product> cartItems = [];
  int totalPrice = 0;

  void addProduct(Product product, int count) {
    var existhing = cartItems.where(
      (cartList) => cartList.name == product.name,
    );
    cartItems.add(product);
  }
}
