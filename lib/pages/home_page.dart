import 'package:donnut_app_4sa/tabs/burger_tab.dart';
import 'package:donnut_app_4sa/tabs/donut_tab.dart';
import 'package:donnut_app_4sa/tabs/pancakes_tab.dart';
import 'package:donnut_app_4sa/tabs/pizza_tab.dart';
import 'package:donnut_app_4sa/tabs/smoothie_tab.dart';
import 'package:donnut_app_4sa/utils/shopping_cart.dart';
import 'package:flutter/material.dart';
import 'package:donnut_app_4sa/utils/my_tab.dart';
import 'package:donnut_app_4sa/utils/cart_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CartService _cartService = CartService();

  List<Widget> myTabs = [
    const MyTab(iconPath: 'lib/icons/donut.png', tabName: 'Donut'),
    const MyTab(iconPath: 'lib/icons/burger.png', tabName: 'Burger'),
    const MyTab(iconPath: 'lib/icons/smoothie.png', tabName: 'Smoothie'),
    const MyTab(iconPath: 'lib/icons/pancakes.png', tabName: 'Pancakes'),
    const MyTab(iconPath: 'lib/icons/pizza.png', tabName: 'Pizza'),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          leading: Icon(Icons.menu, color: Colors.grey[800]),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 24),
              child: Icon(Icons.person),
            ),
          ],
        ),
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  Text("I want to ", style: TextStyle(fontSize: 32)),
                  Text(
                    "Eat",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),

            // TabBar
            TabBar(tabs: myTabs),

            // TabBarView
            Expanded(
              child: TabBarView(children: [
                DonutTab(cartService: _cartService),
                BurgerTab(),
                SmoothieTab(),
                PancakesTab(),
                PizzaTab(),
              ]),
            ),

            // Shopping Cart (simplified without navigation)
            ListenableBuilder(
                listenable: _cartService,
                builder: (context, child) {
                  return ShoppingCart(
                    itemCount: _cartService.itemCount,
                    totalPrice: _cartService.totalPrice,
                    onViewCart: () {
                      // Show a simple dialog instead of navigating to a new page
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Your Cart'),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('${_cartService.itemCount} items in cart'),
                              Text(
                                  'Total: \$${_cartService.totalPrice.toStringAsFixed(2)}'),
                              // You can also list the items here if you want
                              ..._cartService.items.map((item) => ListTile(
                                    leading:
                                        Image.asset(item['image'], width: 40),
                                    title: Text(item['flavor']),
                                    subtitle: Text(item['store']),
                                    trailing: Text(
                                        '\$${item['price'].toStringAsFixed(2)}'),
                                  )),
                            ],
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('OK'),
                            ),
                            TextButton(
                              onPressed: () {
                                _cartService.clearCart();
                                Navigator.pop(context);
                              },
                              child: const Text('Clear Cart'),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }),
          ],
        ),
      ),
    );
  }
}
