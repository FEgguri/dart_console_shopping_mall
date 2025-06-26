import 'dart:io';
import 'package:intl/intl.dart';
import 'package:shopping_mall_dart/models/model_Product.dart';
import '../cart.dart';

class ShoppingMall {
  List<Product> products; // = [];
  late Cart cart; // 장바구니
  String formatCurrency(int price) {
    return NumberFormat('#,###').format(price);
  }

  void home() {
    print(
      '[1] 상품 목록 보기 / [2] 장바구니에 담기 / [3] 장바구니에 담긴 상품의 총 가격 보기 / [4] 프로그램 종료 / [6] 장바구니 비우기',
    );
    var inputStringValue = stdin.readLineSync();

    // 입력값에 따라 다른 동작 수행 시작
    switch (inputStringValue) {
      case '1':
        showProducts();
        break;
      case '2':
        addToCart();
        break;
      case '3':
        showTotal();
        break;
      case '4':
        exitProgram();
        break;
      case '6':
        removeFromCart();
        break;
      default:
        print('잘못된 입력입니다.  1 2 3 4 6중 하나를 입력해주세요');
        home(); // 잘못된 입력 시 다시 홈으로 돌아가기
    }
    // 입력값에 따라 다른 동작 수행 끝
  }

  // 생성자에서 상품 목록 초기화
  ShoppingMall()
    : cart = Cart(),
      products = [
        Product('Stun Gun', 2010, 5),
        Product('Lightsaber', 400, 5),
        Product('No Brand Dark Chocolate', 4000000, 5),
        Product('Dress Shirt', 24430, 5),
        Product('Apgujeong Hyundai Apartment', 70000, 5),
        Product('Lecture Room', 356720, 5),
        Product('Caramel Popcorn', 8000, 5),
      ];

  //상품 목록 출력 [1]
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

      print(
        '${product.name.padRight(maxLength)}  /  ${formatCurrency(product.price)}원',
      );
    }
    print('"' * (maxLength + 20));
    //상품 목록 스타일링 끝
    home();
  }

  //장바구니담기 [2]
  void addToCart() {
    print('장바구니에 담을 상품의 이름과 수량을 입력해주세요. (ex. Lightsaber 5) [4]프로그램 종료');
    var inputItem = stdin.readLineSync();
    // if (int.parse(inputItem) == 4 ) {
    //   exitProgram();
    // }
    //입력값 확인
    if (inputItem != null) {
      var part = inputItem.split(' ');
      var name = part.sublist(0, part.length - 1).join(' '); //상품이름
      var count = int.tryParse(part[part.length - 1]); //수량

      var existItem = products.where((e) => e.name == name); //상품이름 존재하는지

      if (existItem.isEmpty) {
        print('해당 상품이 존재 하지않습니다. 다시 입력해주세요.');
        addToCart();
      } else if (count == null) {
        print('수량은 숫자로 입력해주세요. 다시 입력해주세요.');
        addToCart();
      } else if (count <= 0) {
        print('수량은 1 이상으로 입력해주세요. 다시 입력해주세요.');
        addToCart();
      } else {
        var price = products.where((e) => e.name == name).first.price;
        cart.cartItems.add(Product(name, price * count, count));
        cart.totalPrice += price * count; //장바구니 총 가격
        print('장바구니에 $name이 $count개 담겼습니다.');
      }
    } else {
      print("입력이 잘못되었습니다. 다시 시도해주세요.");
      addToCart();
    }

    home();
  }

  //장바구니에 담긴 상품의 총 가격 보기 [3]
  void showTotal() {
    if (cart.cartItems.isEmpty) {
      print("장바구니가 비어 있습니다. 상품을 먼저 담아주세요.");
      home();
      return;
    } else {
      String totalItems = cart.cartItems.map((e) => '${e.name}').join(', ');

      print(
        '장바구니에 담긴 상품은 $totalItems이며  총 가격은 ${formatCurrency(cart.totalPrice)}원입니다.',
      );
      home();
    }
  }

  //장바구니 비우기 [6]

  void removeFromCart() {
    if (cart.cartItems.isEmpty) {
      print("장바구니가 비어 있습니다. 상품을 먼저 담아주세요.");
      home();
      return;
    } else {
      print("장바구니를 초기화합니다.");
      cart.cartItems.clear(); // 장바구니 비우기
      cart.totalPrice = 0; // 총 가격 초기화
      home();
    }
  }

  // 프로그램 종료 [4]
  void exitProgram() {
    bool exitConfirmed = false;

    while (!exitConfirmed) {
      print('프로그램을 종료합니다. 종료하시겠습니까? [Y/N]');
      var input = stdin.readLineSync();

      if (input?.toUpperCase() == 'Y') {
        print('프로그램을 종료합니다.');
        exit(0);
      } else if (input?.toUpperCase() == 'N') {
        print('프로그램을 계속 진행합니다.');
        // 프로그램을 계속 진행하기 위해 다시 입력 받기
        home(); // 재귀 호출로 다시 시작
      } else {
        print('잘못된 입력입니다. Y 또는 N을 입력해주세요.');
      }
    }
  }
}
