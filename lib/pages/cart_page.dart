// cart_page.dart
import 'package:donnut_app_4sa/utils/cart_service.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  final CartService cartService;

  const CartPage({super.key, required this.cartService});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Your Cart')),
      body: ListView.builder(
        itemCount: cartService.items.length,
        itemBuilder: (context, index) {
          final item = cartService.items[index];
          return ListTile(
            leading: Image.asset(item['image']),
            title: Text(item['name']),
            subtitle: Text(item['store']),
            trailing: Text('\$${item['price']}'),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          'Total: \$${cartService.totalPrice.toStringAsFixed(2)}',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
