import 'package:donnut_app_4sa/utils/smoothie_tile.dart';
import 'package:donnut_app_4sa/utils/cart_service.dart';
import 'package:flutter/material.dart';

class SmoothieTab extends StatelessWidget {
  final CartService cartService;

  // list of smoothies
  final List smoothiesOnSale = [
    // [ smoothieFlavor, smoothiePrice, smoothieColor, imageName, smoothieStore ]
    [
      "Strawberry Banana",
      "36",
      Colors.redAccent,
      "lib/images/smoothies/smoothie_share.png",
      "Jamba Juice"
    ],
    [
      "Mango Tango",
      "45",
      Colors.orange,
      "lib/images/smoothies/tapioca_smoothie.png",
      "Smoothie King"
    ],
    [
      "Blueberry Blast",
      "84",
      Colors.blue,
      "lib/images/smoothies/this_is_not_a_smoothie.png",
      "Tropical Smoothie"
    ],
    [
      "Green Detox",
      "95",
      Colors.pink,
      "lib/images/smoothies/strawberry_smoothie.png",
      "Nékter"
    ],
  ];

  SmoothieTab({super.key, required this.cartService});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1 / 1.5,
      ),
      itemCount: smoothiesOnSale.length,
      padding: const EdgeInsets.all(12),
      itemBuilder: (BuildContext context, int index) {
        return SmoothieTile(
          smoothieFlavor: smoothiesOnSale[index][0],
          smoothiePrice: smoothiesOnSale[index][1],
          smoothieColor: smoothiesOnSale[index][2],
          imageName: smoothiesOnSale[index][3],
          smoothieStore: smoothiesOnSale[index][4],
          onAddToCart: () {
            cartService.addItem(
              smoothiesOnSale[index][0], // flavor
              smoothiesOnSale[index][1], // price
              smoothiesOnSale[index][4], // store
              smoothiesOnSale[index][3], // image
            );
          },
        );
      },
    );
  }
}