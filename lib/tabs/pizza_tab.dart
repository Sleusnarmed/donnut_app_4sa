import 'package:donnut_app_4sa/utils/pizza_tile.dart';
import 'package:donnut_app_4sa/utils/cart_service.dart';
import 'package:flutter/material.dart';

class PizzaTab extends StatelessWidget {
  final CartService cartService;

  // list of pizzas
  final List pizzasOnSale = [
    // [ pizzaFlavor, pizzaPrice, pizzaColor, imageName, pizzaStore ]
    [
      "Pepperoni",
      "80",
      Colors.orange,
      "lib/images/pizza/crazy_pizza.png",
      "Pizza Hut"
    ],
    [
      "Margarita",
      "70",
      Colors.green,
      "lib/images/pizza/pizza_animada.png",
      "Domino's"
    ],
    [
      "BBQ Chicken",
      "95",
      Colors.brown,
      "lib/images/pizza/pizza.png",
      "Little Caesars"
    ],
    [
      "Hawaiian",
      "85",
      Colors.yellow,
      "lib/images/pizza/no_buy.png",
      "Papa John's"
    ],
     [
      "Pepperoni",
      "80",
      Colors.orange,
      "lib/images/pizza/crazy_pizza.png",
      "Pizza Hut"
    ],
    [
      "Margarita",
      "70",
      Colors.green,
      "lib/images/pizza/pizza_animada.png",
      "Domino's"
    ],
    [
      "BBQ Chicken",
      "95",
      Colors.brown,
      "lib/images/pizza/pizza.png",
      "Little Caesars"
    ],
    [
      "Hawaiian",
      "85",
      Colors.yellow,
      "lib/images/pizza/no_buy.png",
      "Papa John's"
    ],
  ];

  PizzaTab({super.key, required this.cartService});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1 / 1.5,
      ),
      itemCount: pizzasOnSale.length,
      padding: const EdgeInsets.all(12),
      itemBuilder: (BuildContext context, int index) {
        return PizzaTile(
          pizzaFlavor: pizzasOnSale[index][0],
          pizzaPrice: pizzasOnSale[index][1],
          pizzaColor: pizzasOnSale[index][2],
          imageName: pizzasOnSale[index][3],
          pizzaStore: pizzasOnSale[index][4],
          onAddToCart: () {
            cartService.addItem(
              pizzasOnSale[index][0], // flavor
              pizzasOnSale[index][1], // price
              pizzasOnSale[index][4], // store
              pizzasOnSale[index][3], // image
            );
          },
        );
      },
    );
  }
}
