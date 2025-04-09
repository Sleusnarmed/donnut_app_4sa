import 'package:flutter/material.dart';
import 'package:donnut_app_4sa/utils/cart_service.dart';
import 'package:donnut_app_4sa/utils/pancakes_tile.dart';

class PancakesTab extends StatelessWidget {
  final CartService cartService;

  final List pancakesOnSale = [
    // [ flavor, price, color, image, store ]
    [
      "Classic Maple",
      "39",
      Colors.amber,
      "lib/images/pancakes/full_meal_pancakes.png",
      "Pancake House"
    ],
    [
      "Berry Bliss",
      "47",
      Colors.pink,
      "lib/images/pancakes/WHAT.png",
      "Sweet Stack"
    ],
    [
      "Blueberry Bomb",
      "79",
      Colors.indigo,
      "lib/images/pancakes/pancakes.png",
      "Stacks on Stacks"
    ],
    [
      "Choco Chip",
      "90",
      Colors.red,
      "lib/images/pancakes/strawberry_pancakes.png",
      "Pancake Palace"
    ],
  ];

  PancakesTab({super.key, required this.cartService});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1 / 1.5,
      ),
      itemCount: pancakesOnSale.length,
      padding: const EdgeInsets.all(12),
      itemBuilder: (BuildContext context, int index) {
        return PancakeTile(
          pancakeFlavor: pancakesOnSale[index][0],
          pancakePrice: pancakesOnSale[index][1],
          pancakeColor: pancakesOnSale[index][2],
          imageName: pancakesOnSale[index][3],
          pancakeStore: pancakesOnSale[index][4],
          onAddToCart: () {
            cartService.addItem(
              pancakesOnSale[index][0], // flavor
              pancakesOnSale[index][1], // price
              pancakesOnSale[index][4], // store
              pancakesOnSale[index][3], // image
            );
          },
        );
      },
    );
  }
}
