import 'package:shopping_mall_dart/models/model_Product.dart';

class Cart {
  List<Product> cartItems = [];
  int totalPrice = 0;

  void addProduct(Product product, int count) {
    var existing = cartItems.where((cartList) => cartList.name == product.name);

    if (existing.isEmpty) {
      cartItems.add(Product(product.name, product.price * count, count));
    } else {
      var item = existing.first;
      item.itemCount += count;
      item.price += product.price * count;
      totalPrice = item.price;
    }
  }
}
