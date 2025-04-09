import 'package:donnut_app_4sa/utils/donut_tile.dart';
import 'package:donnut_app_4sa/utils/cart_service.dart';
import 'package:flutter/material.dart';

class DonutTab extends StatelessWidget {
  final CartService cartService;

  // list of donuts
  final List donutsOnSale = [
    // [ donutFlavor, donutPrice, donutColor, imageName, donutStore ]
    [
      "Ice Cream",
      "36",
      Colors.blue,
      "lib/images/donuts/icecream_donut.png",
      "Dunkin Donuts"
    ],
    [
      "Strawberry",
      "45",
      Colors.red,
      "lib/images/donuts/strawberry_donut.png",
      "Krispy Kreme"
    ],
    [
      "Grape Ape",
      "84",
      Colors.purple,
      "lib/images/donuts/grape_donut.png",
      "Relleno Donuts"
    ],
    [
      "Choco",
      "95",
      Colors.brown,
      "lib/images/donuts/chocolate_donut.png",
      "Sheeesh Donuts"
    ],
  ];

  DonutTab({super.key, required this.cartService});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1 / 1.5,
      ),
      itemCount: donutsOnSale.length,
      padding: const EdgeInsets.all(12),
      itemBuilder: (BuildContext context, int index) {
        return DonutTile(
          donutFlavor: donutsOnSale[index][0],
          donutPrice: donutsOnSale[index][1],
          donutColor: donutsOnSale[index][2],
          imageName: donutsOnSale[index][3],
          donutStore: donutsOnSale[index][4],
          onAddToCart: () {
            cartService.addItem(
              donutsOnSale[index][0], // flavor
              donutsOnSale[index][1], // price
              donutsOnSale[index][4], // store
              donutsOnSale[index][3], // image
            );
          },
        );
      },
    );
  }
}
