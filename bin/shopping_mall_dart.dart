import 'package:intl/intl.dart';
import 'package:shopping_mall_dart/shopping_mall_dart.dart'
    as shopping_mall_dart;

//name과 price를 가진 Product 클래스 생성 2025.06.24 이영상
class Product {
  String name;
  int price;

  Product(this.name, this.price);
}

class ShoppingMall {
  List<Product> products = [];
  int totalPrice = 0;

  ShoppingMall()
    : products = [
        Product('Stun Gun', 2010),
        Product('Lightsaber', 400),
        Product('No Brand Dark Chocolate', 4000000),
        Product('Dress Shirt', 24430),
        Product('Apgujeong Hyundai Apartment', 70000),
        Product('Lecture Room', 356720),
        Product('Caramel Popcorn', 8000),
      ];

  void showProducts() {
    int maxLength = 0; // 제품 이름의 최대 길이를 구하기위한 함수 2025.06.24 이영상
    for (var product in products) {
      if (maxLength < product.name.length) maxLength = product.name.length;
    }

    for (var product in products) {
      //제품 이름과 가격 출력
      final formatCurrency = NumberFormat('#,###'); //원화 포맷 적용 2025.06.24 이영상

      print(
        '${product.name.padRight(maxLength)}  /  ${formatCurrency.format(product.price)}원',
      );
    }
  }
}

void main(List<String> arguments) {
  var mall = ShoppingMall();
  mall.showProducts();
}
