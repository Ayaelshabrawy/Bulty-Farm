import 'package:flutter/foundation.dart';
import 'product-cart.dart';

class Cart with ChangeNotifier {
  final List<Product> products = [];

  List<Product> get productList => List.unmodifiable(products);

  double get totalPrice {
    double total = 0.0;
    products.forEach((id) {
      total += id.price;
    });
    return total;
  }

  void addItem(Product product) {
    products.add(product);
    notifyListeners();
  }

  void removeItem(String id) {
    final existingIndex = products.indexWhere((item) => item.id == id);
    if (existingIndex != -1) {
      products.removeAt(existingIndex);
      notifyListeners();
    } else {
      print('Item with ID $id not found in cart.');
    }
  }

  void clearCart() {
    products.clear();
    notifyListeners();
  }
}
