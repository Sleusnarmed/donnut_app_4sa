import 'package:donnut_app_4sa/utils/burger_tile.dart';
import 'package:donnut_app_4sa/utils/cart_service.dart';
import 'package:flutter/material.dart';

class BurgerTab extends StatelessWidget {
  final CartService cartService;

  // list of burgers
  final List burgersOnSale = [
    // [ burgerFlavor, burgerPrice, burgerColor, imageName, burgerStore ]
    [
      "Cangreburger",
      "36",
      Colors.orange,
      "lib/images/burgers/cangreburger.png",
      "Burger King"
    ],
    [
      "Mini Burgers",
      "45",
      Colors.red,
      "lib/images/burgers/mini_burger.png",
      "McDonald's"
    ],
    [
      "Veggie Burger",
      "84",
      Colors.green,
      "lib/images/burgers/burger_and_fries.png",
      "Wendy's"
    ],
    [
      "House's Favorite Burger",
      "95",
      Colors.yellow,
      "lib/images/burgers/burger.png",
      "Five Guys"
    ],
    [
      "Cangreburger",
      "36",
      Colors.orange,
      "lib/images/burgers/cangreburger.png",
      "Burger King"
    ],
    [
      "Mini Burgers",
      "45",
      Colors.red,
      "lib/images/burgers/mini_burger.png",
      "McDonald's"
    ],
    [
      "Veggie Burger",
      "84",
      Colors.green,
      "lib/images/burgers/burger_and_fries.png",
      "Wendy's"
    ],
    [
      "House's Favorite Burger",
      "95",
      Colors.yellow,
      "lib/images/burgers/burger.png",
      "Five Guys"
    ],
  ];

  BurgerTab({super.key, required this.cartService});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1 / 1.5,
      ),
      itemCount: burgersOnSale.length,
      padding: const EdgeInsets.all(12),
      itemBuilder: (BuildContext context, int index) {
        return BurgerTile(
          burgerFlavor: burgersOnSale[index][0],
          burgerPrice: burgersOnSale[index][1],
          burgerColor: burgersOnSale[index][2],
          imageName: burgersOnSale[index][3],
          burgerStore: burgersOnSale[index][4],
          onAddToCart: () {
            cartService.addItem(
              burgersOnSale[index][0], // flavor
              burgersOnSale[index][1], // price
              burgersOnSale[index][4], // store
              burgersOnSale[index][3], // image
            );
          },
        );
      },
    );
  }
}