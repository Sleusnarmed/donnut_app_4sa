import 'package:flutter/foundation.dart';

class CartService with ChangeNotifier {
  final List<Map<String, dynamic>> _items = [];
  double _totalPrice = 0.0;

  List<Map<String, dynamic>> get items => _items;
  double get totalPrice => _totalPrice;

  void addItem(String name, String price, String store, String imageName) {
    _items.add({
      'name': name,
      'price': price,
      'store': store,
      'image': imageName,
    });
    _totalPrice += double.parse(price);
    notifyListeners(); // This triggers UI updates
  }

  int get itemCount => _items.length;
}
