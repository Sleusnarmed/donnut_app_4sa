import 'package:flutter/foundation.dart';

class CartService with ChangeNotifier {
  int _itemCount = 0;
  double _totalPrice = 0.0;
  final List<Map<String, dynamic>> _items = [];

  int get itemCount => _itemCount;
  double get totalPrice => _totalPrice;
  List<Map<String, dynamic>> get items => _items;

  void addItem(String flavor, String price, String store, String image) {
    _items.add({
      'flavor': flavor,
      'price': double.parse(price),
      'store': store,
      'image': image,
    });
    _itemCount = _items.length;
    _totalPrice = _items.fold(0, (sum, item) => sum + item['price']);
    notifyListeners(); // This notifies all listeners that the cart has changed
  }

  void clearCart() {
    _items.clear();
    _itemCount = 0;
    _totalPrice = 0.0;
    notifyListeners();
  }
}
