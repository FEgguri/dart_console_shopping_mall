import 'package:intl/intl.dart';
import 'package:shopping_mall_dart/shopping_mall_dart.dart'
    as shopping_mall_dart;
import 'dart:io';

// 첫 생성 2025.06.24 이영상
//name과 price를 가진 Product 클래스 생성 2025.06.24 이영상
class Product {
  String name;
  int price;

  Product(this.name, this.price);
}

class ShoppingMall {
  List<Product> products = [];
  int totalPrice = 0;
  // 생성자에서 상품 목록 초기화
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

  //상품 목록 출력
  void showProducts() {
    //상품목록 스타일링 시작
    int maxLength = 0;
    String textLine = '" * ${maxLength + 20}';

    for (var product in products) {
      if (maxLength < product.name.length) maxLength = product.name.length;
    }

    print('[상품 목록]');
    print('=' * (maxLength + 20));
    print('상품명'.padRight(maxLength) + '/  가격');
    print('"' * (maxLength + 20));
    for (var product in products) {
      //제품 이름과 가격 출력
      final formatCurrency = NumberFormat('#,###'); //원화 포맷 적용 2025.06.24 이영상

      print(
        '${product.name.padRight(maxLength)}  /  ${formatCurrency.format(product.price)}원',
      );
    }
    print('"' * (maxLength + 20));
    //상품 목록 스타일링 끝
    //안내
  }

  void addToCart() {}
  void removeFromCart() {}
  void showTotal() {}
}

void main(List<String> arguments) {
  var shoppingMall = ShoppingMall();
  print('[1] 상품 목록 보기 / [2] 장바구니에 담기 / [3] 장바구니에 담긴 상품의 총 가격 보기 / [4] 프로그램 종료');
  var inputStringValue = stdin.readLineSync();

  switch (inputStringValue) {
    case '1':
      shoppingMall.showProducts();
      break;
    case '2':
      shoppingMall.addToCart();
      break;
    case '3':
      shoppingMall.showTotal();
      break;
    case '4':
      print('프로그램을 종료합니다. 종료하시겠습니까? [Y/N]');
      if (inputStringValue?.toUpperCase() == 'Y') {
        print('프로그램을 종료합니다.');
      } else if (inputStringValue?.toUpperCase() == 'N') {
        print('프로그램을 계속 진행합니다.');
        exit(0);
      }

    default:
      print('잘못된 입력입니다. 다시 시도해주세요.');
  }
}
